// ignore_for_file: use_key_in_widget_constructors

import 'package:doctor_booking_app/blocs/doctor_details/bloc/doctor_details_bloc.dart';
import 'package:doctor_booking_app/presentation/widgets/custom_app_bar_button.dart';
import 'package:doctor_booking_app/presentation/widgets/doctor_card.dart';
import 'package:doctor_booking_app/repo/doctors_repository.dart';
import 'package:doctor_booking_app/utils/time_of_day_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static const String routeName = "doctor_details_screen";
  final String doctorId;
  const DoctorDetailsScreen({Key? key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) =>
          DoctorDetailsBloc(doctorRepository: context.read<DoctorRepository>())
            ..add(LoadDoctorDetailsEvent(doctorId: doctorId)),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomAppBarButton(
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Doctor's Details",
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          actions:const [
             Icon(Icons.favorite_border_outlined),
          ],
        ),
        body: BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
          builder: (context, state) {
            if (state.status == DoctorDetailsStatus.initial ||
                state.status == DoctorDetailsStatus.loading) {
              return const Center(child:  CircularProgressIndicator.adaptive());
            }
            if (state.status == DoctorDetailsStatus.loaded) {
              final doctor = state.doctor;

              if (doctor == null) {
                return const Center(
                  child: Text("Doctor not found..."),
                );
              }

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    DoctorCard(doctor: state.doctor!),
                    Divider(
                      height: 32,
                      color: colorScheme.surfaceVariant,
                    ),
                    _DoctorWorkingHours(doctor.workingHours)
                  ],
                ),
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ),
      ),
    );
  }
}

class _DoctorWorkingHours extends StatelessWidget {
  final List<DoctorWorkingHours> workingHours;
  const _DoctorWorkingHours(
    this.workingHours,
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Working Hours",
                style: textTheme.labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: Doctor.sampleDoctors[0].workingHours.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        workingHours[index].dayOfWeek,
                        style: textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: colorTheme.primary.withOpacity(0.3),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        workingHours[index]
                            .startTime
                            .toCustomString()
                   
                      ),
                    ),
                    const Text("  -  "),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: colorTheme.primary.withOpacity(0.3),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        workingHours[index].endTime.toCustomString(),
                      ),
                    )
                  ],
                );
              },
            ),
            // Text("data")
          ],
        ),
      ),
    );
  }
}
