<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseBrides extends Seeder
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
                'bride_id' => 'BR0001',
                'image' => '',
                'name' => 'Lorem',
                'nick_name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'bride_id' => 'BR0002',
                'image' => '',
                'name' => 'Lorem',
                'nick_name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('brides')->insert($data);
    }
}
