import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends BaseProvider{
  String doctorName = "Dr. Sarah Johnson";
  String specialization = "Cardiologist";

  double rating = 4.9;

  String doctorImage =
      "https://images.unsplash.com/photo-1559839734-2b71ea197ec2";

  String aboutDoctor =
      "Dr. Sarah Johnson is a highly experienced cardiologist with over 10 years of expertise in treating heart-related conditions. She specializes in preventive cardiology, heart failure management, and minimally invasive procedures.";

  List<String> availableSlots = [
    "09:00 AM",
    "10:30 AM",
    "12:00 PM",
    "02:00 PM",
    "03:30 PM",
    "05:00 PM",
  ];

  String selectedSlot = "10:30 AM";

  void selectSlot(String slot) {
    selectedSlot = slot;
    notifyListeners();
  }

  void bookAppointment(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Appointment booked for $selectedSlot",
        ),
      ),
    );
  }
}