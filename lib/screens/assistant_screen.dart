import 'package:flutter/material.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Text('Assistant Screen',
      textAlign: TextAlign.center,),
    );
  }
}