import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Text('Emergency Screen',
      textAlign: TextAlign.center,),
    );
  }
}