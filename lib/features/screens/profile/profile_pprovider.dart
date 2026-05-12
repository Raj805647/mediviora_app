import 'package:base_module/base_module.dart';

class ProfileProvider extends BaseProvider{
  bool notificationEnabled = false;
  bool darkModeEnabled = false;

  void toggleNotification(bool value) {
    notificationEnabled = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    darkModeEnabled = value;
    notifyListeners();
  }
}