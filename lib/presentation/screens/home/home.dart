// ignore_for_file: prefer_const_constructors, unused_element

import 'package:doctor_booking_app/presentation/widgets/appointment_card.dart';
import 'package:doctor_booking_app/presentation/widgets/avatar.dart';
import 'package:doctor_booking_app/presentation/widgets/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: textTheme.titleMedium,
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "Olamidotun",
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: colorScheme.secondary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  //come back and add the dynamic location
                  "Lagos, NG",
                  style: textTheme.labelLarge,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.expand_more,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search for doctors...",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: const [
            _DoctorCategories(),
            _MySchedule(),
            _NearbyDoctors(),
          ],
        ),
      ),
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          text: "Nearby Doctors",
          action: "See more",
          onPressed: () {},
        ),
      ],
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          text: "My Schedule",
          action: "See more",
          onPressed: () {},
        ),
        const AppointmentCard(),
      ],
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTile(
          text: "Categories",
          action: "See more",
          onPressed: () {},
        ),
        Row(
            children: DoctorCategory.values
                .take(5)
                .map(
                  (category) => Expanded(
                    child: CustomCircleAvatar(
                      label: category.name,
                      icon: category.icon,
                    ),
                  ),
                )
                .toList())
      ],
    );
  }
}
