<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseGalleries extends Seeder
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
                'gallery_id' => 'GL0001',
                'image' => '',
                'description' => 'Lorem ipsum dolor ismet.',
                'type' => 'gallery',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'gallery_id' => 'GL0002',
                'image' => '',
                'description' => 'Lorem ipsum dolor ismet.',
                'type' => 'gallery',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'gallery_id' => 'GL0003',
                'image' => '',
                'description' => 'Lorem ipsum dolor ismet.',
                'type' => 'gallery',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('galleries')->insert($data);
    }
}
