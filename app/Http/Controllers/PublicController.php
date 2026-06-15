<?php

namespace App\Http\Controllers;

use App\Exports\GuestsExport;
use App\Exports\GuestBooksExport;
use App\Exports\ReservationsExport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Category;
use App\Benefit;
use App\Bizpar;
use App\Article;
use App\Invitation;
use App\Event;
use App\Bride;
use App\Gallery;
use App\Comment;
use App\Parents;
use App\Theme;
use App\Song;
use App\Guest;
use App\GuestBook;
use App\SpecialThanks;
use App\LoveStories;
use App\ReservationList;
use App\ReservationSchedule;

use PDF;

class PublicController extends Controller
{
    public function counter()
    {
        $data = [
            'themes' => Theme::count(),
            'invitations' => Invitation::count(),
            'events' => Event::count(),
            'guests' => Guest::count(),
            'reservations' => ReservationList::count(),
            'guestbooks' => GuestBook::count(),
            'brides' => Bride::count(),
            'comments' => Comment::count(),
        ];
        $response = [
            'message' => 'proceed success',
            'status' => 'ok',
            'code' => '201',
            'data' => $data
        ];
        return response()->json($response, 200);
    }

    public function category(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'limit' => 'required|integer',
            'offset' => 'required|integer'
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
            $limit = $req['limit'];
            $offset = $req['offset'];
            $data = Category::where(['status' => 'active'])->limit($limit)->offset($offset)->orderBy('id', 'desc')->get();
            
            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function benefit(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'limit' => 'required|integer',
            'offset' => 'required|integer'
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
            $limit = $req['limit'];
            $offset = $req['offset'];
            $data = Benefit::where(['status' => 'active'])->limit($limit)->offset($offset)->orderBy('id', 'desc')->get();
            
            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function article(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'limit' => 'required|integer',
            'offset' => 'required|integer'
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
            $limit = $req['limit'];
            $offset = $req['offset'];
            $data = Article::where(['status' => 'active'])->limit($limit)->offset($offset)->orderBy('id', 'desc')->get();
            
            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function articleByID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'article_id' => 'required|string',
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
            $article_id = $req['article_id'];
            $data = Article::where(['article_id' => $article_id, 'status' => 'active'])->first();

            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function invitationByID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'short_link' => 'required|string',
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
            $short_link = $req['short_link'];
            $data = Invitation::where(['short_link' => $short_link, 'status' => 'active'])->first();

            if ($data) 
            {
                $dump = json_decode($data, true);

                $events = Event::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                $galleries = Gallery::where(['invitation_id' => $dump['id'], 'type' => 'gallery', 'status' => 'active'])->orderBy('id', 'asc')->get();
                $covers = Gallery::where(['invitation_id' => $dump['id'], 'type' => 'cover', 'status' => 'active'])->orderBy('id', 'asc')->get();
                $comments = Comment::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                $specialthanks = SpecialThanks::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                $loveStories = LoveStories::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                $schedules = ReservationSchedule::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                $theme = Theme::where(['id' => $dump['theme_id']])->first();
                $song = Song::where(['id' => $dump['song_id']])->first();
                $guest = null;
                
                if ($req['guest_id']) {
                    $guest = ReservationList::where(['invitation_id' => $dump['id'], 'reservation_list_id' => $req['guest_id'], 'status' => 'active'])->first();
                }

                $newBrides = array();
                $brides = Bride::where(['invitation_id' => $dump['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();

                $dumpBride = json_decode($brides, true);

                for ($i=0; $i < count($dumpBride); $i++) { 
                    $bride = $dumpBride[$i];
                    $parents = Parents::where(['bride_id' => $dumpBride[$i]['id'], 'status' => 'active'])->orderBy('id', 'asc')->get();
                    $payload = [
                        'bride' => $bride,
                        'parents' => $parents
                    ];
                    array_push($newBrides, $payload);
                }

                $payload = [
                    'invitation' => $dump,
                    'events' => $events,
                    'brides' => $newBrides,
                    'galleries' => $galleries,
                    'covers' => $covers,
                    'comments' => $comments,
                    'theme' => $theme,
                    'song' => $song,
                    'guest' => $guest,
                    'specialthanks' => $specialthanks,
                    'loveStories' => $loveStories,
                    'schedules' => $schedules,
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

    public function invitationByLink(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'short_link' => 'required|string',
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
            $short_link = $req['short_link'];
            $data = Invitation::where(['short_link' => $short_link, 'status' => 'active'])->first();

            if ($data) 
            {
                $dump = json_decode($data, true);

                $events = Event::where(['invitation_id' => $dump['id']])->orderBy('id', 'asc')->get();
                $galleries = Gallery::where(['invitation_id' => $dump['id'], 'type' => 'gallery'])->orderBy('id', 'asc')->get();
                $covers = Gallery::where(['invitation_id' => $dump['id'], 'type' => 'cover'])->orderBy('id', 'asc')->get();
                $comments = Comment::where(['invitation_id' => $dump['id']])->orderBy('id', 'asc')->get();
                $specialthanks = SpecialThanks::where(['invitation_id' => $dump['id']])->orderBy('id', 'asc')->get();
                $theme = Theme::where(['id' => $dump['theme_id']])->first();
                $song = Song::where(['id' => $dump['song_id']])->first();
                $guest = Guest::where(['invitation_id' => $dump['id'], 'name' => $req['guest_name']])->first();

                $newBrides = array();
                $brides = Bride::where(['invitation_id' => $dump['id']])->orderBy('id', 'asc')->get();

                $dumpBride = json_decode($brides, true);

                for ($i=0; $i < count($dumpBride); $i++) { 
                    $bride = $dumpBride[$i];
                    $parents = Parents::where(['bride_id' => $dumpBride[$i]['id']])->orderBy('id', 'asc')->get();
                    $payload = [
                        'bride' => $bride,
                        'parents' => $parents
                    ];
                    array_push($newBrides, $payload);
                }

                $payload = [
                    'invitation' => $dump,
                    'events' => $events,
                    'brides' => $newBrides,
                    'galleries' => $galleries,
                    'covers' => $covers,
                    'comments' => $comments,
                    'theme' => $theme,
                    'song' => $song,
                    'guest' => $guest,
                    'specialthanks' => $specialthanks
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

    public function commentByInvID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'invitation_id' => 'required|string',
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
            $invitation_id = $req['invitation_id'];
            $invitation = Invitation::where(['invitation_id' => $invitation_id, 'status' => 'active'])->first();
            $data = Comment::where(['invitation_id' => $invitation['id']])->orderBy('id', 'desc')->get();

            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function commentPost(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'comment_id' => 'required|string|min:0|max:17|unique:comments',
            'name' => 'required|string',
            'comment' => 'required|string',
            'status' => 'required|string',
            'is_available' => 'required|boolean',
            'invitation_id' => 'required|string'
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
            $invitation_id = $req['invitation_id'];
            $invitation = Invitation::where(['invitation_id' => $invitation_id, 'status' => 'active'])->first();

            $payload = [
                'comment_id' => $req['comment_id'],
                'name' => $req['name'],
                'comment' => $req['comment'],
                'status' => $req['status'],
                'is_available' => $req['is_available'],
                'invitation_id' => $invitation['id'],
                'created_by' => 'GUEST',
                'created_at' => date('Y-m-d H:i:s')
            ];

            $data = Comment::insert($payload);

            if ($data)
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => Comment::where(['comment_id' => $req['comment_id']])->first()
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

    public function guestByInvID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'invitation_id' => 'required|string',
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
            $invitation_id = $req['invitation_id'];
            $invitation = Invitation::where(['invitation_id' => $invitation_id, 'status' => 'active'])->first();
            $data = Guest::where(['invitation_id' => $invitation['id']])->orderBy('updated_at', 'desc')->get();

            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data,
                    'total_present' => Guest::where(['invitation_id' => $invitation['id'], 'present_type' => 'present'])->sum('attendance'),
                    'total_will_present' => Guest::where(['invitation_id' => $invitation['id'], 'present_type' => 'will-present'])->sum('attendance'),
                    'total_not_present' => Guest::where(['invitation_id' => $invitation['id'], 'present_type' => 'not-present'])->count(),
                    'total_waiting_present' => Guest::where(['invitation_id' => $invitation['id'], 'present_type' => 'waiting-response'])->count(),
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

    public function guestPost(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'guest_id' => 'required|string|min:0',
            'name' => 'required|string',
            'present_type' => 'required|string',
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
            // check existing guest
            $checkExistingGuest = Guest::where(['name' => $req['name']])
                ->where(['guest_id' => $req['guest_id']])
                ->where(['invitation_id' => $req['invitation_id']])
                ->first();

            if ($checkExistingGuest) {
                 $payload = [
                    'name' => $checkExistingGuest->name,
                    'comments' => $req['comments'],
                    'attendance' => $req['attendance'],
                    'present_type' => $req['present_type'] ? $req['present_type'] : 'waiting-response',
                    'rsvp' => $req['rsvp'],
                    'is_present' => $req['is_present'],
                    'updated_by' => $req['invitation_id'],
                    'updated_at' => date('Y-m-d H:i:s')
                ];

                $data = Guest::where(['name' => $req['name']])
                    ->where(['guest_id' => $req['guest_id']])
                    ->where(['invitation_id' => $req['invitation_id']])
                    ->update($payload);

                if ($data) {
                    $newData = Guest::where(['name' => $req['name']])
                        ->where(['guest_id' => $req['guest_id']])
                        ->where(['invitation_id' => $req['invitation_id']])
                        ->first();

                    $response = [
                        'message' => 'proceed success',
                        'status' => 'ok',
                        'code' => '201',
                        'is_updated' => 'true',
                        'data' => $newData
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
            } else {
                $payload = [
                    'guest_id' => $req['custom_guest_id'],
                    'name' => $req['name'],
                    'phone' => $req['phone'],
                    'address' => $req['address'],
                    'comments' => $req['comments'],
                    'attendance' => $req['attendance'],
                    'present_type' => $req['present_type'] ? $req['present_type'] : 'waiting-response',
                    'rsvp' => $req['rsvp'],
                    'is_present' => $req['is_present'],
                    'status' => $req['status'],
                    'is_available' => $req['is_available'],
                    'invitation_id' => $req['invitation_id'],
                    'created_by' => $req['invitation_id'],
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_by' => $req['invitation_id'],
                    'updated_at' => date('Y-m-d H:i:s')
                ];

                $data = Guest::insert($payload);

                if ($data) {
                    $newData = Guest::where(['guest_id' => $req['custom_guest_id']])->first();

                    $response = [
                        'message' => 'proceed success',
                        'status' => 'ok',
                        'code' => '201',
                        'is_updated' => 'false',
                        'data' => $newData
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
        }

        return response()->json($response, 200);
    }

    public function guestDelete(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'guest_id' => 'required|string',
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
            $data = Guest::where(['guest_id' => $req['guest_id']])->delete();

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

    public function reservationByInvID(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'invitation_id' => 'required|string',
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
            $invitation_id = $req['invitation_id'];
            $invitation = Invitation::where(['invitation_id' => $invitation_id, 'status' => 'active'])->first();
            $data = ReservationList::where(['invitation_id' => $invitation['id']])->orderBy('updated_at', 'desc')->get();

            if ($data) 
            {
                $newPayload = array();
                $dump = json_decode($data, true);

                for ($i=0; $i < count($dump); $i++) { 
                    $payload = $dump[$i];
                    $schedule = ReservationSchedule::where(['id' => $dump[$i]['reservation_schedule_id'], 'status' => 'active'])->first();
                    $payload['schedule'] = $schedule;
                    array_push($newPayload, $payload);
                }

                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $newPayload,
                    'total_present' => ReservationList::where(['invitation_id' => $invitation['id'], 'present_type' => 'present'])->sum('attendance'),
                    'total_will_present' => ReservationList::where(['invitation_id' => $invitation['id'], 'present_type' => 'will-present'])->sum('attendance'),
                    'total_not_present' => ReservationList::where(['invitation_id' => $invitation['id'], 'present_type' => 'not-present'])->count(),
                    'total_waiting_present' => ReservationList::where(['invitation_id' => $invitation['id'], 'present_type' => 'waiting-response'])->count(),
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

    public function reservationPost(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_list_id' => 'required|string|min:0',
            'name' => 'required|string',
            'present_type' => 'required|string',
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
            // check existing guest
            $checkExistingGuest = ReservationList::where(['name' => $req['name']])
                ->where(['reservation_list_id' => $req['reservation_list_id']])
                ->where(['invitation_id' => $req['invitation_id']])
                ->first();

            if ($checkExistingGuest) {
                 $payload = [
                    'name' => $checkExistingGuest->name,
                    'comments' => $req['comments'],
                    'attendance' => $req['attendance'],
                    'present_type' => $req['present_type'] ? $req['present_type'] : 'waiting-response',
                    'reservation_schedule_id' => $req['reservation_schedule_id'],
                    'updated_by' => $req['invitation_id'],
                    'updated_at' => date('Y-m-d H:i:s')
                ];

                $data = ReservationList::where(['name' => $req['name']])
                    ->where(['reservation_list_id' => $req['reservation_list_id']])
                    ->where(['invitation_id' => $req['invitation_id']])
                    ->update($payload);

                if ($data) {
                    $newData = ReservationList::where(['name' => $req['name']])
                        ->where(['reservation_list_id' => $req['reservation_list_id']])
                        ->where(['invitation_id' => $req['invitation_id']])
                        ->first();

                    $response = [
                        'message' => 'proceed success',
                        'status' => 'ok',
                        'code' => '201',
                        'is_updated' => 'true',
                        'data' => $newData
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
            } else {
                $payload = [
                    'reservation_list_id' => $req['custom_reservation_list_id'],
                    'name' => $req['name'],
                    'phone' => $req['phone'],
                    'address' => $req['address'],
                    'comments' => $req['comments'],
                    'attendance' => $req['attendance'],
                    'present_type' => $req['present_type'] ? $req['present_type'] : 'waiting-response',
                    'status' => $req['status'],
                    'is_available' => $req['is_available'],
                    'invitation_id' => $req['invitation_id'],
                    'reservation_schedule_id' => $req['reservation_schedule_id'],
                    'created_by' => $req['invitation_id'],
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_by' => $req['invitation_id'],
                    'updated_at' => date('Y-m-d H:i:s')
                ];

                $data = ReservationList::insert($payload);

                if ($data) {
                    $newData = ReservationList::where(['reservation_list_id' => $req['custom_reservation_list_id']])->first();

                    $response = [
                        'message' => 'proceed success',
                        'status' => 'ok',
                        'code' => '201',
                        'is_updated' => 'false',
                        'data' => $newData
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
        }

        return response()->json($response, 200);
    }

    public function reservationDelete(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'reservation_list_id' => 'required|string',
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
            $data = ReservationList::where(['reservation_list_id' => $req['reservation_list_id']])->delete();

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

    public function getBizparByType(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'limit' => 'required|integer',
            'offset' => 'required|integer',
            'type' => 'required|string'
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
            $limit = $req['limit'];
            $offset = $req['offset'];
            $type = $req['type'];
            $data = Bizpar::where(['type' => $type])->limit($limit)->offset($offset)->orderBy('id', 'desc')->get();
            
            if ($data) 
            {
                $response = [
                    'message' => 'proceed success',
                    'status' => 'ok',
                    'code' => '201',
                    'data' => $data
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

    public function guestExport($id)
    {
        return Excel::download(new GuestsExport($id), 'Guest-Download-IV-'.$id.'.xlsx');
    }

    public function guestBookExport($id)
    {
        return Excel::download(new GuestBooksExport($id), 'Guest-Book-Download-IV-'.$id.'.xlsx');
    }

    public function reservationExport($id) {
        return Excel::download(new ReservationsExport($id), 'Reservation-Download-RSPV-'.$id.'.xlsx');
    }

    public function invitationReceipt($id)
    {
        $invitation_id = $id;
        $data = Invitation::where(['invitation_id' => $invitation_id, 'status' => 'active'])->first();

        $dump = json_decode($data, true);

        $theme = Theme::where(['id' => $dump['theme_id']])->first();

        $payload = [
            'invitation' => $dump,
            'theme' => $theme,
        ];

        // return view('invitation-receipt', ['invitation' => $payload]);

        $opciones_ssl = array(
            "ssl" => array(
                "verify_peer"=>false,
                "verify_peer_name"=>false,
            ),
        );
        $img_path = public_path('images/logo.png');
        $extencion = pathinfo($img_path, PATHINFO_EXTENSION);
        $data = file_get_contents($img_path, false, stream_context_create($opciones_ssl));
        $img_base_64 = base64_encode($data);
        $path_img = 'data:image/' . $extencion . ';base64,' . $img_base_64;

        $pdf = PDF::loadview('invitation-receipt', ['invitation' => $payload, 'image' => $path_img]);
        return $pdf->stream('nota-pembayaran');
    }
}
