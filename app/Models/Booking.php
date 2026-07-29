<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name',
        'email',
        'meeting_type',
        'scheduled_date',
        'scheduled_time',
        'notes',
        'status',
        'is_paid',
    ];

    protected $casts = [
        'scheduled_date' => 'date',
        'is_paid' => 'boolean',
    ];
}
