import 'package:flutter/material.dart';
import 'package:flutter_rick/pages/home_page.dart';

void main() {
  runApp(FlutterRickApp());
}

class FlutterRickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rick',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
