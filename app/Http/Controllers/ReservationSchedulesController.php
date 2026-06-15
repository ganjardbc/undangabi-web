<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\ReservationSchedule;
use App\Invitation;

class ReservationSchedulesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function getAll(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'limit' => 'required|integer',
            'offset' => 'required|integer',
            'status' => 'string',
            'user_id' => 'integer',
            'invitation_id' => 'string'
        ]);

        $response = [];

        if ($validator->fails()) 
        {
            $response = [
                'message' => $validator->errors(),
                'status' => 'invalide',
                'code' => '201',
                'data' => []
            ];
        } 
        else 
        {
            $uID = $req['user_id'];
            $invitationId = $req['invitation_id'];
            $status = $req['status'];
            $limit = $req['limit'];
            $offset = $req['offset'];
            $stt = $status ? ['status' => $status] : [];
            $totalRecord = 0;

            if ($uID) 
            {
                $data = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where(['created_by' => $uID])
                    ->limit($limit)
                    ->offset($offset)
                    ->orderBy('id', 'desc')
                    ->get();
                $totalRecord = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where(['created_by' => $uID])
                    ->count();
            } 
            else if ($invitationId) {
                $invitation = Invitation::where(['invitation_id' => $invitationId])->first();
                $data = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where(['invitation_id' => $invitation->id])
                    ->limit($limit)
                    ->offset($offset)
                    ->orderBy('id', 'desc')
                    ->get();
                $totalRecord = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where(['invitation_id' => $invitation->id])
                    ->count();
            }
            else 
            {
                $data = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where('description', 'LIKE', '%'.$req['search'].'%')
                    ->limit($limit)
                    ->offset($offset)
                    ->orderBy('id', 'desc')
                    ->get();
                $totalRecord = ReservationSchedule::where($stt)
                    ->where('title', 'LIKE', '%'.$req['search'].'%')
                    ->where('description', 'LIKE', '%'.$req['search'].'%')
                    ->count();
            }

            if ($data) 
            {
                $newPayload = array();

                $dump = json_decode($data, true);

                for ($i=0; $i < count($dump); $i++) { 
                    $schedules = $dump[$i];
                    $stt = $status ? ['status' => $status] : [];
                    $invitation = Invitation::where(['id' => $dump[$i]['invitation_id']])->orderBy('id', 'desc')->first();
                    $payload = [
                        'reservationSchedule' => $schedules,
                        'invitation' => $invitation
                    ];
                    array_push($newPayload, $payload);
                }

                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $newPayload,
                    'total_record' => $totalRecord
                ];
            } 
            else 
            {
                $response = [
                    'message' => 'failed to get datas',
                    'status' => 'failed',
                    'code' => '201',
                    'data' => [],
                    'total_record' => $totalRecord
                ];
            }
        }

        return response()->json($response, 200);
    }

    public function getByID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_schedule_id' => 'required|string|min:0|max:17',
        ]);

        $response = [];

        if ($validator->fails()) 
        {
            $response = [
                'message' => $validator->errors(),
                'status' => 'invalide',
                'code' => '201',
                'data' => []
            ];
        } 
        else 
        {
            $reservation_schedule_id = $req['reservation_schedule_id'];
            $data = ReservationSchedule::where(['reservation_schedule_id' => $reservation_schedule_id])->first();
            
            if ($data) 
            {
                $dump = json_decode($data, true);

                $invitation = Invitation::where(['id' => $dump['invitation_id']])->orderBy('id', 'desc')->first();
                $payload = [
                    'reservationSchedule' => $dump,
                    'invitation' => $invitation
                ];

                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $payload
                ];
            } 
            else 
            {
                $response = [
                    'message' => 'failed to get datas',
                    'status' => 'failed',
                    'code' => '201',
                    'data' => []
                ];
            }
        }

        return response()->json($response, 200);
    }

    public function post(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_schedule_id' => 'required|string|min:0|max:17|unique:reservation_schedules',
            'title' => 'required|string',
            'schedule_date' => 'required|date',
            'schedule_time' => 'required|string',
            'schedule_timezone' => 'required|string',
            'status' => 'required|string',
            'is_available' => 'required|boolean',
            'invitation_id' => 'required|integer'
        ]);

        $response = [];

        if ($validator->fails()) 
        {
            $response = [
                'message' => $validator->errors(),
                'status' => 'invalide',
                'code' => '201',
                'data' => []
            ];
        } 
        else 
        {
            $payload = [
                'reservation_schedule_id' => $req['reservation_schedule_id'],
                'title' => $req['title'],
                'schedule_date' => $req['schedule_date'],
                'schedule_time' => $req['schedule_time'],
                'schedule_timezone' => $req['schedule_timezone'],
                'status' => $req['status'],
                'is_available' => $req['is_available'],
                'invitation_id' => $req['invitation_id'],
                'created_by' => Auth()->user()->id,
                'created_at' => date('Y-m-d H:i:s')
            ];

            $data = ReservationSchedule::insert($payload);

            if ($data)
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => ReservationSchedule::where(['reservation_schedule_id' => $req['reservation_schedule_id']])->first()
                ];
            }
            else 
            {
                $response = [
                    'message' => 'failed to save',
                    'status' => 'failed',
                    'code' => '201',
                    'data' => []
                ];
            }
        }

        return response()->json($response, 200);
    }

    public function update(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_schedule_id' => 'required|string|min:0|max:17',
            'title' => 'required|string',
            'schedule_date' => 'required|date',
            'schedule_time' => 'required|string',
            'schedule_timezone' => 'required|string',
            'status' => 'required|string',
            'is_available' => 'required|boolean',
            'invitation_id' => 'required|integer'
        ]);

        $response = [];

        if ($validator->fails()) 
        {
            $response = [
                'message' => $validator->errors(),
                'status' => 'invalide',
                'code' => '201',
                'data' => []
            ];
        } 
        else 
        {
            $payload = [
                'title' => $req['title'],
                'schedule_date' => $req['schedule_date'],
                'schedule_time' => $req['schedule_time'],
                'schedule_timezone' => $req['schedule_timezone'],
                'status' => $req['status'],
                'is_available' => $req['is_available'],
                'invitation_id' => $req['invitation_id'],
                'updated_by' => Auth()->user()->id,
                'updated_at' => date('Y-m-d H:i:s')
            ];

            $data = ReservationSchedule::where(['reservation_schedule_id' => $req['reservation_schedule_id']])->update($payload);

            if ($data)
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => ReservationSchedule::where(['reservation_schedule_id' => $req['reservation_schedule_id']])->first()
                ];
            }
            else 
            {
                $response = [
                    'message' => 'failed to save',
                    'status' => 'failed',
                    'code' => '201',
                    'data' => []
                ];
            }
        }

        return response()->json($response, 200);
    }

    public function delete(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_schedule_id' => 'required|string|min:0|max:17',
        ]);

        $response = [];

        if ($validator->fails()) 
        {
            $response = [
                'message' => $validator->errors(),
                'status' => 'invalide',
                'code' => '201',
                'data' => []
            ];
        } 
        else 
        {
            $data = ReservationSchedule::where(['reservation_schedule_id' => $req['reservation_schedule_id']])->delete();

            if ($data)
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => []
                ];
            }
            else 
            {
                $response = [
                    'message' => 'failed to delete',
                    'status' => 'failed',
                    'code' => '201',
                    'data' => []
                ];
            }
        }

        return response()->json($response, 200);
    }
}
