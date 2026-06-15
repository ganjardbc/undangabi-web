<?php

namespace App\Imports;

use App\ReservationList;
use Maatwebsite\Excel\Concerns\ToModel;

class ReservationsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new ReservationList([
            'reservation_list_id' => "RL-" . strtotime("now"),
            'name' => $row[0],
            'phone' => null,
            'address' => $row[1],
            'comments' => null,
            'present_type' => 'waiting-response',
            'status' => 'active',
            'is_available' => 1,
            'invitation_id' => 0
        ]);
    }
}
