import 'package:doctor_booking_app/presentation/widgets/custom_app_bar-button.dart';
import 'package:doctor_booking_app/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorDetailsScreen extends StatefulWidget {
  static const String routeName = "doctor_details_screen";

  final String? doctorId;
  const DoctorDetailsScreen({super.key, this.doctorId});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  bool hasFav = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
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
        actions: [
          CustomAppBarButton(
            icon: hasFav ? Icons.favorite : Icons.favorite_outline,
            onPressed: () {
              setState(() {
                hasFav = !hasFav;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DoctorCard(
              doctor: Doctor.sampleDoctors[0],
            ),
            Divider(
              height: 32,
              color: colorScheme.surfaceVariant,
            ),
            const _DoctorWorkingHours()
          ],
        ),
      ),
    );
  }
}

class _DoctorWorkingHours extends StatelessWidget {
  const _DoctorWorkingHours({
    super.key,
  });

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
                        Doctor.sampleDoctors[0].workingHours[index].dayOfWeek,
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
                        "${Doctor.sampleDoctors[0].workingHours[index].startTime.hour}am",
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
                          "${Doctor.sampleDoctors[0].workingHours[index].endTime.hour}pm"),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
