import 'package:flutter/material.dart';
import 'property_form_widget.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PropertyFormWidget(
          onSubmit: (name, location, price) {
            // Handle property addition logic here
            print('Property Name: $name');
            print('Location: $location');
            print('Price: $price');

            // Navigate back or show a success message
            Navigator.pop(
                context, true); // Pass `true` to indicate successful submission
          },
        ),
      ),
    );
  }
}
