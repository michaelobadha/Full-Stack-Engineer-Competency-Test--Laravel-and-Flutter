# Full Stack Engineer Competency Test: Laravel and Flutter
 
Property Management System API

This repository contains the backend API for a Property Management System built with Laravel. The API allows users to manage property data, including adding, editing, deleting, and viewing properties.
Features

    Add new properties to the system.
    Edit existing property details.
    Delete properties from the system.
    View a list of all properties.
    Fetch details of a specific property.

Tech Stack

    Framework: Laravel
    Database: MySQL
    API Testing: Postman

Setup Instructions
1. Prerequisites

Make sure you have the following installed:

    PHP (>=8.1)
    Composer
    MySQL
    Laravel (>=10.0)

2. Clone the Repository

git clone https://github.com/your-username/property-management-api.git
cd property-management-api

3. Install Dependencies

Run the following command to install PHP dependencies:

composer install

4. Set Up Environment Variables

    Copy the .env.example file to .env:

cp .env.example .env

Update the .env file with your database credentials:

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=property_management
    DB_USERNAME=your_db_username
    DB_PASSWORD=your_db_password

5. Run Database Migrations

Create the database tables by running migrations:

php artisan migrate

6. Start the Development Server

Run the Laravel development server:

php artisan serve

The API will be available at: http://127.0.0.1:8000/api
API Endpoints
Base URL

All endpoints are prefixed with /api.
1. List Properties

    Endpoint: GET /properties
    Description: Fetches a list of all properties.

2. Create a Property

    Endpoint: POST /properties
    Description: Adds a new property.
    Request Body:

    {
      "name": "Luxury Villa",
      "location": "Dubai Marina",
      "price": 1500000,
      "description": "A beautiful villa with a sea view."
    }

3. View a Property

    Endpoint: GET /properties/{id}
    Description: Fetches details of a specific property.

4. Update a Property

    Endpoint: PUT /properties/{id}
    Description: Updates details of an existing property.
    Request Body (example):

    {
      "price": 1600000
    }

5. Delete a Property

    Endpoint: DELETE /properties/{id}
    Description: Deletes a property.