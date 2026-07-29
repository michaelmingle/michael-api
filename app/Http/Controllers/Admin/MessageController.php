<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\MessageResource;
use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    public function index()
    {
        return MessageResource::collection(Message::latest()->get());
    }

    public function update(Request $request, Message $message)
    {
        $data = $request->validate([
            'isRead' => ['required', 'boolean'],
        ]);

        $message->update(['is_read' => $data['isRead']]);

        return new MessageResource($message);
    }

    public function destroy(Message $message)
    {
        $message->delete();

        return response()->json(['message' => 'Message deleted.']);
    }
}
