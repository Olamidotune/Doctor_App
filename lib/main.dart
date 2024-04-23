import 'package:doctor_booking_app/config/theme.dart';
import 'package:doctor_booking_app/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().themeData,
      home: const HomeScreen()
    );
  }
}
