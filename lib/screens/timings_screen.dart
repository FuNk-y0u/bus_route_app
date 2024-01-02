import 'package:flutter/material.dart';

class TimingsScreen extends StatefulWidget {
  const TimingsScreen({super.key});

  @override
  State<TimingsScreen> createState() => _TimingsScreenState();
}

class _TimingsScreenState extends State<TimingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Text('Timings Screen',
      textAlign: TextAlign.center,),
    );
  }
}