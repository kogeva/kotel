import 'dart:io';
import 'dart:math';
import 'package:boiler_control/scrren/home_page_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HeaterApp());
}

class HeaterApp extends StatelessWidget {
  const HeaterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Heater'),
    );
  }
}
