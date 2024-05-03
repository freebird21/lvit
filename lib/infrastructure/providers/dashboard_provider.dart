import 'package:flutter/cupertino.dart';
import 'package:lvit/ui/chat/chat_screen.dart';
import 'package:lvit/ui/home/home_screen.dart';
import 'package:lvit/ui/location/location_screen.dart';
import 'package:lvit/ui/star_screen/star_screen.dart';
import 'package:lvit/ui/user_setting/user_setting_screen.dart';

class DashboardProvider extends ChangeNotifier {

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex({required int index}){
    _selectedIndex  = index;
    notifyListeners();
  }

  Widget tabWidgets() {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const LocationScreen();
      case 2:
        return const StarScreen();
      case 3:
        return const ChatScreen();
      case 4:
        return const UserSettingScreen();
      default:
        return const SizedBox.shrink();
    }
  }



}