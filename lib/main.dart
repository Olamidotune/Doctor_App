
import 'package:doctor_booking_app/blocs/home/home_bloc.dart';
import 'package:doctor_booking_app/config/theme.dart';
import 'package:doctor_booking_app/presentation/screens/doctor_details/doctor_details.dart';
import 'package:doctor_booking_app/presentation/screens/home/home.dart';
import 'package:doctor_booking_app/repo/doctors_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // ignore: prefer_const_constructors
  final doctorRepository = DoctorRepository();
  runApp(AppScreen(
    doctorRepository: doctorRepository,
  ));
}

class AppScreen extends StatelessWidget {
  final DoctorRepository doctorRepository;
  const AppScreen({
    super.key,
    required this.doctorRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: doctorRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(
                LoadHomeScreenEvent(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: const AppTheme().themeData,
          home: const HomeScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            DoctorDetailsScreen.routeName: (context) =>
                const DoctorDetailsScreen(doctorId: '',)
          },
        ),
      ),
    );
  }
}
