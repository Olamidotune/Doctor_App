import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final dynamic myAppointments;
  const AppointmentCard({
    super.key,
    this.myAppointments,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                9.0,
              ),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorScheme.primary, colorScheme.secondary]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      "No Appointment Yet",
                      style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(
                0.3,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(
                  5,
                ),
              ),
            ),
          ),
          Container(
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: colorScheme.secondary.withOpacity(
                0.15,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(
                  5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
