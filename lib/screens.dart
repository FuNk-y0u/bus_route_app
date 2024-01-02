
import 'package:bus_route_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bus_route_app/screens/map_screen.dart';
import 'package:bus_route_app/screens/timings_screen.dart';
import 'package:bus_route_app/screens/settings_screen.dart';
import 'package:bus_route_app/screens/assistant_screen.dart';
import 'package:bus_route_app/screens/emergency_screen.dart';

class Screens{
  int index = 0;

  List<StatefulWidget> screens = [
    const HomeScreen(),
    const MapScreen(),
    const TimingsScreen(),
    const AssistantScreen(),
    const EmergencyScreen(),
    const SettingsScreen(),
    
  ];

  void change_screen_index(int newIndex){
    index = newIndex;
  }

  StatefulWidget get_current_screen(){
    return screens[index];
  }
}