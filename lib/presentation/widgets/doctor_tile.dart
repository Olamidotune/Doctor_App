import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;
  const DoctorListTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
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
      trailing: ElevatedButton(onPressed:() {
        
      }, child: Text("Book now")),
    );
  }
}
