<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSongs extends Seeder
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
                'song_id' => 'SG0001',
                'name' => 'SONGS 1',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'song_id' => 'SG0002',
                'name' => 'SONGS 2',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '2',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'song_id' => 'SG0003',
                'name' => 'SONGS 3',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '3',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('songs')->insert($data);
    }
}
