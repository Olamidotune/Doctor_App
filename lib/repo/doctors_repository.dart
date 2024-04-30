import 'package:models/models.dart';

class DoctorRepository {
  const DoctorRepository(
      //this is where in a real life senerio, the api will come in.

      );
  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return DoctorCategory.values;
  }

  Future<List<Doctor>> fetchDoctors() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return Doctor.sampleDoctors;
  }

  Future<List<Doctor>> fetchDoctorByCategories(String catergoryId) async {
    throw UnimplementedError();
  }

  Future<List<Doctor>> fetchDoctorById(String doctorId) async {
    throw UnimplementedError();
  }
}
