import 'package:base_module/base_module.dart';
import 'package:flutter/cupertino.dart';

import '../ai/ai_screen.dart';
import '../explore/explore_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../schedule/schedule_screen.dart';

class BottomNavBarProvider extends BaseProvider {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const ScheduleScreen(),
    const ProfileScreen(),
  ];
}
