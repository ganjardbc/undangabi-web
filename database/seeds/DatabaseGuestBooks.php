<?php

use Illuminate\Database\Seeder;

class DatabaseGuestBooks extends Seeder
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
                'guest_book_id' => 'GB0001',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '',
                'address' => '',
                'attendance' => '1',
                'present_type' => 'present',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '2',
                'guest_book_id' => 'GB0002',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '',
                'address' => '',
                'attendance' => '1',
                'present_type' => 'present',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ],
            [
                'id' => '3',
                'guest_book_id' => 'GB0003',
                'image' => '',
                'name' => 'Lorem',
                'phone' => '',
                'address' => '',
                'attendance' => '1',
                'present_type' => 'present',
                'status' => 'active',
                'is_available' => '1',
                'invitation_id' => '1',
                "created_at" => '2020-06-28 19:08:45',
                "updated_at" => '2020-06-28 19:08:45'
            ]
        ];

        DB::table('guest_books')->insert($data);
    }
}
