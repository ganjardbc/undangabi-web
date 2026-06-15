<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseGuests extends Seeder
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
                'guest_id' => 'GE0001',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '082999222333',
                'address' => 'Jl. Lorem',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'guest_id' => 'GE0002',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '082999222333',
                'address' => 'Jl. Lorem',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'guest_id' => 'GE0003',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '082999222333',
                'address' => 'Jl. Lorem',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('guests')->insert($data);
    }
}
