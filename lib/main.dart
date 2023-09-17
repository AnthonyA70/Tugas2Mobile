import 'package:flutter/material.dart';
import 'package:tugas2anthony/login_screen.dart';
import 'package:tugas2anthony/set_time.dart';
import 'package:tugas2anthony/stopwatch.dart';
import 'package:tugas2anthony/tampilan_nav.dart';
import 'package:tugas2anthony/tentang_saya.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  Widget build (BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}