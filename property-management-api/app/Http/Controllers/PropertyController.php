<?php

namespace App\Http\Controllers;

use App\Models\Property;
use Illuminate\Http\Request;

class PropertyController extends Controller
{
    // Fetch all properties
    public function index()
    {
        return response()->json(Property::all());
    }

    // Fetch a specific property
    public function show($id)
    {
        $property = Property::find($id);
        if ($property) {
            return response()->json($property);
        }
        return response()->json(['message' => 'Property not found'], 404);
    }

    // Create a new property
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'location' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $property = Property::create($validated);
        return response()->json($property, 201);
    }

    // Update an existing property
    public function update(Request $request, $id)
    {
        $property = Property::find($id);
        if (!$property) {
            return response()->json(['message' => 'Property not found'], 404);
        }

        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'location' => 'sometimes|required|string|max:255',
            'price' => 'sometimes|required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $property->update($validated);
        return response()->json($property);
    }

    // Delete a property
    public function destroy($id)
    {
        $property = Property::find($id);
        if (!$property) {
            return response()->json(['message' => 'Property not found'], 404);
        }

        $property->delete();
        return response()->json(['message' => 'Property deleted successfully']);
    }
}