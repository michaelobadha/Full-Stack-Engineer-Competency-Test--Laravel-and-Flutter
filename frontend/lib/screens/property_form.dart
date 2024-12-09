import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/property_bloc.dart';
import '../models/property_model.dart';

class PropertyForm extends StatefulWidget {
  final Property? property;
  final bool isEditing;

  const PropertyForm({Key? key, this.property, this.isEditing = false})
      : super(key: key);

  @override
  _PropertyFormState createState() => _PropertyFormState();
}

class _PropertyFormState extends State<PropertyForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String location;
  late double price;

  @override
  void initState() {
    super.initState();
    name = widget.property?.name ?? '';
    location = widget.property?.location ?? '';
    price = widget.property?.price ?? 0.0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.isEditing) {
        // Update property
        context.read<PropertyBloc>().add(
              UpdateProperty(
                Property(
                  id: widget.property!.id,
                  name: name,
                  location: location,
                  price: price,
                ),
              ),
            );
      } else {
        // Add new property
        context.read<PropertyBloc>().add(
              AddProperty(
                Property(
                  id: DateTime.now()
                      .millisecondsSinceEpoch, // Temporary unique ID
                  name: name,
                  location: location,
                  price: price,
                ),
              ),
            );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Property' : 'Add Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the property name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                initialValue: location,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the property location';
                  }
                  return null;
                },
                onSaved: (value) {
                  location = value!;
                },
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child:
                    Text(widget.isEditing ? 'Update Property' : 'Add Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
