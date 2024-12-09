import 'package:flutter/material.dart';

class PropertyFormWidget extends StatefulWidget {
  final String? initialName;
  final String? initialLocation;
  final double? initialPrice;
  final Function(String name, String location, double price) onSubmit;

  const PropertyFormWidget({
    Key? key,
    this.initialName,
    this.initialLocation,
    this.initialPrice,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _PropertyFormWidgetState createState() => _PropertyFormWidgetState();
}

class _PropertyFormWidgetState extends State<PropertyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String location;
  late double price;

  @override
  void initState() {
    super.initState();
    name = widget.initialName ?? '';
    location = widget.initialLocation ?? '';
    price = widget.initialPrice ?? 0.0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(name, location, price);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
