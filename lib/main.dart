import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import  'package:bus_route_app/screens.dart';
import 'package:bus_route_app/themes/themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  @override 
  void initState() { 
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); 
    super.initState(); 
  } 
  final Screens _screens = Screens();

  GNav navigation_bar(BuildContext context) {
    return GNav(
      tabBackgroundColor: Colors.white,
      backgroundColor: Colors.grey.shade400,
      tabs:  const[
        GButton(icon: Icons.home, text: 'Home',),
        GButton(icon: Icons.map_rounded, text: 'Map',),
        GButton(icon: Icons.watch, text: 'Timings',),
        GButton(icon: Icons.assistant, text: 'Assistant',),
        GButton(icon: Icons.emergency, text: 'Emergency',),
        GButton(icon: Icons.settings, text: 'Settings',),
      ],
      onTabChange: (value) => {
        setState(() {
          _screens.change_screen_index(value);
        },)
      },
    );
  }

  AppBar app_bar(){
    return AppBar(title: const Text('Bus Route App'),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      home:  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea( child:_screens.get_current_screen()),
        bottomNavigationBar: Container(
          color: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: navigation_bar(context),
          ),
        ),
      ),
    );
  }
}
