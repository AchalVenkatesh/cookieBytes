// ignore_for_file: prefer_const_constructors

import 'package:counter_app/auth/login_or_register.dart';
import 'package:flutter/material.dart';

import 'components/registerPage.dart';
import 'pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginOrRegister());
  }
}
