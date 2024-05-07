import 'package:equatable/equatable.dart';

import 'doctor_address.dart';
import 'doctor_category.dart';
import 'doctor_package.dart';
import 'doctor_working_hours.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.workingHours,
    required this.category,
    required this.address,
    required this.packages,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        bio,
        profileImageUrl,
        workingHours,
        category,
        address,
        packages,
        rating,
        reviewCount,
        patientCount,
      ];

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. John Doe',
      bio:
          'Dr. John Doe is a cardiologist in New York, New York and is affiliated with multiple hospitals in the area, including Lenox Hill Hospital and NYU Langone Hospitals. He received his medical degree from University of California San Francisco School of Medicine and has been in practice between 11-20 years. He is one of 102 doctors at Lenox Hill Hospital and one of 102 at NYU Langone Hospitals who specialize in Cardiovascular Disease.',
      profileImageUrl: 'https://shorturl.at/fuY59',
      category: DoctorCategory.familyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '2',
      name: 'Dr. Samuel David',
      bio: 'Dentist',
      profileImageUrl: 'https://shorturl.at/gkmCE',
      category: DoctorCategory.generalSurgery,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '3',
      name: 'Dr. John Smith',
      bio: 'Cardiologist',
      profileImageUrl: 'https://shorturl.at/ikzY7',
      category: DoctorCategory.cardiology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.8,
      reviewCount: 120,
      patientCount: 800,
    ),
    Doctor(
      id: '4',
      name: 'Dr. Emily Johnson',
      bio: 'Pediatrician',
      profileImageUrl: 'https://shorturl.at/jtAMY',
      category: DoctorCategory.pediatrics,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.9,
      reviewCount: 150,
      patientCount: 900,
    ),
    // Add more doctor data entries here...
    Doctor(
      id: '5',
      name: 'Dr. Michael Williams',
      bio: 'Orthopedic Surgeon',
      profileImageUrl: 'https://shorturl.at/hwyFL',
      category: DoctorCategory.neurology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.7,
      reviewCount: 110,
      patientCount: 850,
    ),
    Doctor(
      id: '6',
      name: 'Dr. John Smith',
      bio: 'Cardiologist',
      profileImageUrl: 'https://example.com/profile_images/dr_john_smith.jpg',
      category: DoctorCategory.cardiology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.8,
      reviewCount: 120,
      patientCount: 1500,
    ),
    Doctor(
      id: '7',
      name: 'Dr. Emily Johnson',
      bio: 'Pediatrician',
      profileImageUrl:
          'https://example.com/profile_images/dr_emily_johnson.jpg',
      category: DoctorCategory.pediatrics,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.7,
      reviewCount: 90,
      patientCount: 800,
    ),
    Doctor(
      id: '8',
      name: 'Dr. Michael Brown',
      bio: 'Ophthalmologist',
      profileImageUrl:
          'https://example.com/profile_images/dr_michael_brown.jpg',
      category: DoctorCategory.internalMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.9,
      reviewCount: 150,
      patientCount: 2000,
    ),
    Doctor(
      id: '9',
      name: 'Dr. Sarah Lee',
      bio: 'Neurologist',
      profileImageUrl: 'https://example.com/profile_images/dr_sarah_lee.jpg',
      category: DoctorCategory.neurology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.6,
      reviewCount: 110,
      patientCount: 1200,
    ),
    Doctor(
      id: '10',
      name: 'Dr. David Martinez',
      bio: 'Orthopedic Surgeon',
      profileImageUrl:
          'https://example.com/profile_images/dr_david_martinez.jpg',
      category: DoctorCategory.pulmonology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.7,
      reviewCount: 95,
      patientCount: 850,
    ),
  ];
}
