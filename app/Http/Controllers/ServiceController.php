<?php

namespace App\Http\Controllers;

use App\Http\Resources\ServiceResource;
use App\Models\Service;

class ServiceController extends Controller
{
    public function index()
    {
        return ServiceResource::collection(
            Service::where('is_published', true)->orderBy('sort_order')->get()
        );
    }
}
