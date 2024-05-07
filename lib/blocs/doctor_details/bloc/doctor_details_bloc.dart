import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_booking_app/repo/doctors_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

part 'doctor_details_event.dart';
part 'doctor_details_state.dart';

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {
  final DoctorRepository _doctorRepository;
  DoctorDetailsBloc({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository,
        super(DoctorDetailsInitial()) {
    on<LoadDoctorDetailsEvent>(_loadDoctorDetailsEvent);
  }

  FutureOr<void> _loadDoctorDetailsEvent(
      LoadDoctorDetailsEvent event, Emitter<DoctorDetailsState> emit) async {
    emit(state.copyWith(status: DoctorDetailsStatus.loading));
    try {
      final doctor = await _doctorRepository.fetchDoctorById(event.doctorId);

      if (doctor == null) {
        emit(state.copyWith(status: DoctorDetailsStatus.error));
      } else {
        emit(
          state.copyWith(
            status: DoctorDetailsStatus.loaded,
            doctor: doctor,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: DoctorDetailsStatus.error));
    }
  }
}
