import 'package:base_module/providers/base_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingProvider extends BaseProvider {
  int selectedDate = 15;
  String selectedTime = "10:30 AM";
  bool isVideoConsultation = true;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final notesController = TextEditingController();

  List<Map<String, dynamic>> timeSlots = [
    {"time": "9:00 AM", "available": true},
    {"time": "10:30 AM", "available": true},
    {"time": "12:00 PM", "available": false},
    {"time": "2:00 PM", "available": true},
    {"time": "4:00 PM", "available": true},
    {"time": "5:30 PM", "available": false},
  ];

  void selectDate(int date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectTime(String time) {
    selectedTime = time;
    notifyListeners();
  }

  void toggleConsultation(bool value) {
    isVideoConsultation = value;
    notifyListeners();
  }
}