<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseComments extends Seeder
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
                'comment_id' => 'CM0001',
                'image' => '',
                'name' => 'Lorem',
                'comment' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'comment_id' => 'CM0002',
                'image' => '',
                'name' => 'Lorem',
                'comment' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'comment_id' => 'CM0003',
                'image' => '',
                'name' => 'Lorem',
                'comment' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('comments')->insert($data);
    }
}
