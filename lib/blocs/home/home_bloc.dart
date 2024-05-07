import 'dart:async';
import 'package:doctor_booking_app/repo/doctors_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;
  HomeBloc({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository,
        super(const HomeState()) {
    on<LoadHomeScreenEvent>(_loadHomeScreenEvent);
  }

  FutureOr<void> _loadHomeScreenEvent(
      LoadHomeScreenEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      status: HomeStatus.loading,
    ));
    try {
      final categoriesFuture = _doctorRepository.fetchDoctorCategories();
      final doctorFuture = _doctorRepository.fetchDoctors();

// future.wait is calling the two of them togther...
      final response = await Future.wait([categoriesFuture, doctorFuture]);

      final categories = response[0] as List<DoctorCategory>;
      final doctors = response[1] as List<Doctor>;
      emit(state.copyWith(
        status: HomeStatus.loaded,
        doctorCategories: categories,
        nearbyDoctors: doctors,
      ));
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }
}
