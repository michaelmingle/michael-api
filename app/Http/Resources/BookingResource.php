<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'meetingType' => $this->meeting_type,
            'scheduledDate' => optional($this->scheduled_date)->format('Y-m-d'),
            'scheduledTime' => $this->scheduled_time,
            'notes' => $this->notes,
            'status' => $this->status,
            'isPaid' => $this->is_paid,
            'createdAt' => $this->created_at?->toIso8601String(),
        ];
    }
}
