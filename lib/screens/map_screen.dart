import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Text('Maps Screen',
      textAlign: TextAlign.center,),
    );
  }
}