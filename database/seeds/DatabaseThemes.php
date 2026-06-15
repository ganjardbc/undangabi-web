<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseThemes extends Seeder
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
                'theme_id' => 'TH0001',
                'name' => 'THEMES 1',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'theme_id' => 'TH0002',
                'name' => 'THEMES 2',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '2',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'theme_id' => 'TH0003',
                'name' => 'THEMES 3',
                'description' => 'Lorem ipsum dolor ismet.',
                'status' => 'active',
                'is_available' => '1',
                'category_id' => '3',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('themes')->insert($data);
    }
}
