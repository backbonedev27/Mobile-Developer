<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use App\Http\Requests\StoreItemRequest;

class ItemController extends Controller
{
    public function store(StoreItemRequest $request): JsonResponse
    {
        $data = $request->validated();
        $item = Item::create($data);

        return response()->json([
            'message' => 'Item created successfully',
            'item' => $item
        ], 201);
    }
    
  
}
