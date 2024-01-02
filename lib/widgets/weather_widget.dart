import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  final String widgetTextData;
  const WeatherWidget({super.key, required this.widgetTextData});

  @override
  State<WeatherWidget> createState() => WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget> {
  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(image: AssetImage('assets/images/home_screen/weather.jpg'), fit: BoxFit.cover),
      ),
      child: Center(child: 
        widget.widgetTextData == "" ? const CircularProgressIndicator(color: Colors.white70,) :Text(widget.widgetTextData, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),),
      )
    );
  }
}