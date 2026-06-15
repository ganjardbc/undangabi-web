<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSpecialThanks extends Seeder
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
                'specialthanks_id' => 'ST-1624334162067',
                'icon' => '',
                'name' => 'Lorem',
                'link' => 'https://undangabi.com',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'specialthanks_id' => 'ST-1624334162069',
                'icon' => '',
                'name' => 'Lorem',
                'link' => 'https://undangabi.com',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'specialthanks_id' => 'ST-1624334162063',
                'icon' => '',
                'name' => 'Lorem',
                'link' => 'https://undangabi.com',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('special_thanks')->insert($data);
    }
}
