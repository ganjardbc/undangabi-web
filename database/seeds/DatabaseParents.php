<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseParents extends Seeder
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
                'parent_id' => 'PR0001',
                'image' => '',
                'name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'bride_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'parent_id' => 'PR0002',
                'image' => '',
                'name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'bride_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'parent_id' => 'PR0003',
                'image' => '',
                'name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'bride_id' => '2',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '4',
                'parent_id' => 'PR0004',
                'image' => '',
                'name' => 'Lorem',
                'about' => 'Lorem ipsum',
                'status' => 'active',
                'is_available' => '1',
                'bride_id' => '2',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('parents')->insert($data);
    }
}
