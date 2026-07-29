<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255'],
            'meetingType' => ['required', 'string', 'in:zoom,meet,whatsapp,email'],
            'scheduledDate' => ['required', 'date'],
            'scheduledTime' => ['required', 'string'],
            'notes' => ['nullable', 'string'],
        ]);

        $booking = Booking::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'meeting_type' => $data['meetingType'],
            'scheduled_date' => $data['scheduledDate'],
            'scheduled_time' => $data['scheduledTime'],
            'notes' => $data['notes'] ?? null,
            'status' => 'pending',
        ]);

        return response()->json([
            'message' => 'Booking requested — pending confirmation.',
            'id' => $booking->id,
        ], 201);
    }
}
