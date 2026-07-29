<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\BlogPost;
use App\Models\Message;
use App\Models\Product;
use App\Models\Project;
use App\Models\Service;
use App\Models\Testimonial;

class StatsController extends Controller
{
    public function index()
    {
        return response()->json([
            'projects' => Project::count(),
            'products' => Product::count(),
            'blogPosts' => BlogPost::count(),
            'services' => Service::count(),
            'testimonials' => Testimonial::count(),
            'pendingBookings' => Booking::where('status', 'pending')->count(),
            'unreadMessages' => Message::where('is_read', false)->count(),
        ]);
    }
}
