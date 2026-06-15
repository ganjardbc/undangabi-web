<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseInvitations extends Seeder
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
                'invitation_id' => 'IV0001',
                'short_link' => 'invitation-1',
                'title' => 'INVITATION 1',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'status' => 'active',
                'is_available' => '1',
                'theme_id' => '1',
                'song_id' => '1',
                'user_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'invitation_id' => 'IV0002',
                'short_link' => 'invitation-2',
                'title' => 'INVITATION 2',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'status' => 'active',
                'is_available' => '1',
                'theme_id' => '1',
                'song_id' => '1',
                'user_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'invitation_id' => 'IV0003',
                'short_link' => 'invitation-3',
                'title' => 'INVITATION 3',
                'description' => 'Lorem ipsum dolor ismet.',
                'day' => 'Monday',
                'date' => '2021-06-28',
                'status' => 'active',
                'is_available' => '1',
                'theme_id' => '1',
                'song_id' => '1',
                'user_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('invitations')->insert($data);
    }
}
