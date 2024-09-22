import 'package:flutter/material.dart';
import 'package:homework/homepage.dart';
import 'package:homework/item_info.dart';
import 'package:homework/login.dart';
import 'package:homework/sign_up.dart';
import 'package:homework/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home:welcome(),
    );
  }
}
