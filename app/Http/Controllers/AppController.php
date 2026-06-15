<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Invitation;

class AppController extends Controller
{
    public function main($id = null)
    {
        $path = 'non-invitation';
        $payload = [
            'id' => $id,
            'path' => $path,
            'data' => null,
        ];

        if (!is_null($id)) 
        {
            $exploded_id = explode("/", $id); 
            $short_link = $exploded_id ? $exploded_id[0] : $id;
            $data = Invitation::where(['short_link' => $short_link, 'status' => 'active'])->first();

            if ($data) 
            {
                $date = date_create($data['date']);
                $data['date'] = date_format($date, 'l, j F Y');
                $payload['path'] = 'invitation';
                $payload['data'] = $data;
                $payload['id'] = $short_link;
            }
        }

        return view('app', $payload);
    }
}
