import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Start/PageView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pageview(),
    );
  }
}
