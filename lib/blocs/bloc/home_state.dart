// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DoctorCategory> doctorCategory;
  final List<Doctor> nearbyDoctors;
  final List myAppointments;
  const HomeState({
    this.status = HomeStatus.initial,
    this.doctorCategory = const <DoctorCategory>[],
    this.nearbyDoctors = const <Doctor>[],
    this.myAppointments = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<DoctorCategory>? doctorCategory,
    List<Doctor>? nearbyDoctors,
    List? myAppointments,
  }) {
    return HomeState(
      status: status ?? this.status,
      doctorCategory: doctorCategory ?? this.doctorCategory,
      nearbyDoctors: nearbyDoctors ?? this.nearbyDoctors,
      myAppointments: myAppointments ?? this.myAppointments,
    );
  }

  @override
  List<Object> get props => [
        status,
        doctorCategory,
        nearbyDoctors,
        myAppointments,
      ];
}
