import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  final String widgetTextData;
  const CalenderWidget({super.key, required this.widgetTextData});

  @override
  State<CalenderWidget> createState() => CalenderWidgetState();
}

class CalenderWidgetState extends State<CalenderWidget> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(image: AssetImage('assets/images/home_screen/calender.png'), fit: BoxFit.cover),
      ),
      child: Center(child: Text(widget.widgetTextData, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(179, 122, 122, 122)),),)
    );
  }
}