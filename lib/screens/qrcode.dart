import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatefulWidget {
  final String link;
  final String article;
  const QRScreen({super.key, required this.link, required this.article});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Scan To Read More")),
      body: 
      Center(child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: QrImageView(
                data: widget.link,
                version: QrVersions.auto,
                size: 500.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.article, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Color.fromARGB(255, 97, 97, 97)),textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}