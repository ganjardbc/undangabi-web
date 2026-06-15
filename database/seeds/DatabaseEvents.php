<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseEvents extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'id' => '1',
                'event_id' => 'EV0001',
                'title' => 'EVENTS 1',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'time' => '08:00 - 17:00',
                'address' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'event_id' => 'EV0002',
                'title' => 'EVENTS 2',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'time' => '08:00 - 17:00',
                'address' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'event_id' => 'EV0003',
                'title' => 'EVENTS 3',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'time' => '08:00 - 17:00',
                'address' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('events')->insert($data);
    }
}
