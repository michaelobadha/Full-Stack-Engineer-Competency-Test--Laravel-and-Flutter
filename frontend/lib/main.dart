import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/property_bloc.dart';
import 'repositories/property_repository.dart';
import 'screens/home_screen.dart';

void main() {
  final propertyRepository = PropertyRepository();
  runApp(MyApp(propertyRepository: propertyRepository));
}

class MyApp extends StatelessWidget {
  final PropertyRepository propertyRepository;

  const MyApp({Key? key, required this.propertyRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            PropertyBloc(propertyRepository)..add(LoadProperties()),
        child: HomeScreen(),
      ),
    );
  }
}
