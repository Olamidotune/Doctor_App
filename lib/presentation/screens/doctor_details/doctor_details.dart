import 'package:doctor_booking_app/presentation/widgets/custom_app_bar-button.dart';
import 'package:flutter/material.dart';

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
            icon: hasFav ? Icons.favorite: Icons.favorite_outline,
            onPressed: () {
              setState(() {
                hasFav = !hasFav;
              });
            },
          ),
        ],
      ),
    );
  }
}
