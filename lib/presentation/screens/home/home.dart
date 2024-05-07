// ignore_for_file: prefer_const_constructors, unused_element

import 'package:doctor_booking_app/blocs/home/home_bloc.dart';
import 'package:doctor_booking_app/presentation/screens/doctor_details/doctor_details.dart';
import 'package:doctor_booking_app/presentation/widgets/appointment_card.dart';
import 'package:doctor_booking_app/presentation/widgets/avatar.dart';
import 'package:doctor_booking_app/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:doctor_booking_app/presentation/widgets/doctor_tile.dart';
import 'package:doctor_booking_app/presentation/widgets/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

final ScrollController _scrollController = ScrollController();

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
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.status == HomeStatus.loading ||
            state.status == HomeStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == HomeStatus.loaded) {
          return RawScrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            radius: Radius.circular(10),
            thumbColor: colorScheme.secondary.withOpacity(0.6),
            child: SingleChildScrollView(
              controller: _scrollController,
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
        } else {
          return Text("Something went wrong");
        }
      }),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTile(
              text: "Categories",
              action: "See more",
              onPressed: () {},
            ),
            Row(
                //children:DoctorCategory.values...
                children: state.doctorCategories
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
      },
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTile(
              text: "My Schedule",
              action: "See more",
              onPressed: () {},
            ),
            AppointmentCard(
              myAppointments: state.myAppointments.firstOrNull,
            ),
          ],
        );
      },
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({Key? key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTile(
              text: "Nearby Doctors",
              action: "See more",
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 20,
                  color: colorScheme.secondary.withOpacity(0.15),
                );
              },
              itemBuilder: (context, index) {
                final doctor = state.nearbyDoctors[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen(
                          doctorId: doctor.id,
                        ),
                      ),
                    );
                  },
                  child: DoctorListTile(doctor: doctor),
                );
              },
              itemCount: state.nearbyDoctors.length,
            ),
          ],
        );
      },
    );
  }
}
