
import 'package:demo_app1/screens/login.dart';
import 'package:demo_app1/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home:Login(),
      routes:{
        'login': (context) =>Login(),
        'register':(context)=>Register(),
      },
    );
  }
}