<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreItemRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }
    
    public function rules()
    {
        return [
            'nama_barang' => 'required|string|max:255',
            'quantity' => 'required|integer|min:1',
            'harga' => 'required|numeric|min:0',
        ];
    }
  
}
