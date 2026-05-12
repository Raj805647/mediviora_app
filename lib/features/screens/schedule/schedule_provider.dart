import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class ScheduleProvider extends BaseProvider {
  final List<Map<String, dynamic>> appointments = [
    {
      "id": "1",
      "doctor": "Dr. Sarah Johnson",
      "specialty": "Orthopedic Surgeon",
      "hospital": "Apollo Hospital, Delhi",
      "date": "May 15, 2026",
      "time": "10:30 AM",
      "status": "Upcoming",
      "type": "Video Consultation",
      "color": const Color(0xFF00D1FF),
      "avatar": "👩‍⚕️",
    },
    {
      "id": "2",
      "doctor": "Dr. Michael Brown",
      "specialty": "Cardiologist",
      "hospital": "Bumrungrad Hospital, Bangkok",
      "date": "May 20, 2026",
      "time": "2:00 PM",
      "status": "Confirmed",
      "type": "In-Person",
      "color": const Color(0xFF00C48C),
      "avatar": "👨‍⚕️",
    },
    {
      "id": "3",
      "doctor": "Dr. Emily Davis",
      "specialty": "Neurologist",
      "hospital": "Mount Elizabeth Hospital",
      "date": "May 25, 2026",
      "time": "11:00 AM",
      "status": "Pending",
      "type": "Video Consultation",
      "color": const Color(0xFF8B7CFF),
      "avatar": "👩‍⚕️",
    },
  ];

  int selectedTab = 0;

  final List<String> tabs = [
    "All",
    "Upcoming",
    "Past",
  ];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}