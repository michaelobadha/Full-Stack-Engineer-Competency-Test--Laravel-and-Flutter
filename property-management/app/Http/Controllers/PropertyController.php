<?php

namespace App\Http\Controllers;

use App\Models\Property;
use Illuminate\Http\Request;

class PropertyController extends Controller
{
    // List all properties
    public function index()
    {
        return response()->json(Property::all());
    }

    // Store a new property
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'location' => 'required|string|max:255',
            'price' => 'required|numeric',
        ]);

        $property = Property::create($request->all());

        return response()->json($property, 201);
    }

    // Show a single property
    public function show($id)
    {
        $property = Property::findOrFail($id);
        return response()->json($property);
    }

    // Update a property
    public function update(Request $request, $id)
    {
        $property = Property::findOrFail($id);
        $property->update($request->all());

        return response()->json($property);
    }

    // Delete a property
    public function destroy($id)
    {
        Property::destroy($id);
        return response()->json(['message' => 'Property deleted']);
    }
}