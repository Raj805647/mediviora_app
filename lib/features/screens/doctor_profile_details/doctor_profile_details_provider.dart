import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class DoctorProfileDetailsProvider extends BaseProvider{

  bool isFavorite = false;

  int selectedSlot = 0;

  final doctor = DoctorModel(
    name: "Dr. Sarah Johnson",
    specialty: "Senior Cardiologist",
    hospital: "Apollo Hospital, New Delhi",
    image:
    "https://images.unsplash.com/photo-1559839734-2b71ea197ec2",
    rating: 4.9,
    reviews: 1234,
    experience: "15 years",
    patients: "5000+",
    successRate: 98,
    consultationFee: "\$150",
    about:
    "Dr. Sarah Johnson is a highly experienced cardiologist with over 15 years of clinical practice. She specializes in advanced cardiac care and has successfully treated thousands of patients worldwide.",
    specializations: [
      "Interventional Cardiology",
      "Heart Failure",
      "Preventive Cardiology",
      "Cardiac Imaging",
    ],
    availableSlots: [
      SlotModel(
        date: "Today",
        time: "2:00 PM",
        type: "Video",
      ),
      SlotModel(
        date: "Tomorrow",
        time: "10:30 AM",
        type: "In-Person",
      ),
      SlotModel(
        date: "May 12",
        time: "3:00 PM",
        type: "Video",
      ),
    ],
  );

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void selectSlot(int index) {
    selectedSlot = index;
    notifyListeners();
  }
}

class DoctorModel {
  final String name;
  final String specialty;
  final String hospital;
  final String image;
  final double rating;
  final int reviews;
  final String experience;
  final String patients;
  final int successRate;
  final String consultationFee;
  final String about;
  final List<String> specializations;
  final List<SlotModel> availableSlots;

  DoctorModel({
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.experience,
    required this.patients,
    required this.successRate,
    required this.consultationFee,
    required this.about,
    required this.specializations,
    required this.availableSlots,
  });
}

class SlotModel {
  final String date;
  final String time;
  final String type;

  SlotModel({
    required this.date,
    required this.time,
    required this.type,
  });
}