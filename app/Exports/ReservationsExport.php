<?php

namespace App\Exports;

use App\ReservationList;
use App\ReservationSchedule;
use App\Invitation;
use App\Bride;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\FromArray;

class ReservationsExport implements FromArray, WithStyles
{
    protected $id;

    function __construct($id) {
        $this->id = $id;
    }

    public function styles(Worksheet $sheet)
    {
        $sheet->getStyle('A1')->getAlignment()->setWrapText(true);
    }

    public function array(): array 
    {
        $invitation = Invitation::where(['invitation_id' => $this->id])->first();
        $data = ReservationList::where(['invitation_id' => $invitation->id])->get();
        $schedules = ReservationSchedule::where(['invitation_id' => $invitation->id])->get();
        $brides = Bride::where(['invitation_id' => $invitation->id])->get();

        $payload = [
            ['No', 'ID', 'Name', 'Ucapan', 'Tamu Dari', 'Jadwal', 'Status']
        ];

        $no = 1;

        foreach ($data as $item) {
            $presentType = 'Tidak Hadir';
            if ($item->present_type === 'waiting-response') {
                $presentType = 'Menunggu Tanggapan';
            }
            if ($item->present_type === 'not-present') {
                $presentType = 'Tidak Hadir';
            }
            if ($item->present_type === 'will-present') {
                $presentType = 'Akan Hadir - ' . $item->attendance . ' Orang';
            }

            $fromBride = '';
            if ($item->bride_id) {
                foreach ($brides as $bride) {
                    if ($bride->id == $item->bride_id) {
                        $fromBride = $bride->name;
                    }
                }
            }

            $fromSchedule = '';
            if ($item->reservation_schedule_id) {
                foreach ($schedules as $schedule) {
                    if ($schedule->id == $item->reservation_schedule_id) {
                        $fromSchedule = $schedule->title . ' (' . $schedule->schedule_time . ' ' . $schedule->schedule_timezone . ')';
                    }
                }
            }

            array_push($payload, [
                $no,
                $item->reservation_list_id,
                $item->name,
                $item->comments,
                $fromBride,
                $fromSchedule,
                $presentType,
            ]);

            $no++;
        }

        return $payload;
    }
}
