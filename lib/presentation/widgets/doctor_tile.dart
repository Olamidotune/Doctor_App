import 'package:doctor_booking_app/presentation/screens/doctor_details/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;
  // ignore: use_key_in_widget_constructors
  const DoctorListTile({Key? key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DoctorDetailsScreen(doctorId: doctor.id),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            doctor.profileImageUrl,
          ),
        ),
        title: Text(doctor.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.category.name,
              style: textTheme.bodySmall!.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange.shade300,
                  size: 15,
                ),
                Text(
                  doctor.rating.toString(),
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.work,
                  color: Colors.blue.shade300,
                  size: 15,
                ),
                Text(
                  "3 years",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DoctorDetailsScreen(doctorId: doctor.id),
              ),
            );
          },
          child: const Text(
            "Book now",
          ),
        ),
      ),
    );
  }
}
