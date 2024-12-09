<?php

namespace App\Http\Controllers;
use App\Models\Properties;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PropertiesController extends Controller
{
    //
    public function index()
    {
        $properties = Properties::all();
        return response()->json([
            'status' => true,
            'message' => 'Properties retrieved successfully',
            'data' => $properties
        ], 200);
    }

    public function show($id)
    {
        $property = Properties::findOrFail($id);
        return response()->json([
            'status' => true,
            'message' => 'Property found successfully',
            'data' => $customer
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email',
            'location',
            'price',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        $customer = Customer::create($request->all());
        return response()->json([
            'status' => true,
            'message' => 'Customer created successfully',
            'data' => $customer
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:customers,email,' . $id,
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        $customer = Customer::findOrFail($id);
        $customer->update($request->all());

        return response()->json([
            'status' => true,
            'message' => 'Customer updated successfully',
            'data' => $customer
        ], 200);
    }

    public function destroy($id)
    {
        $customer = Customer::findOrFail($id);
        $customer->delete();
        
        return response()->json([
            'status' => true,
            'message' => 'Customer deleted successfully'
        ], 204);
    }
}