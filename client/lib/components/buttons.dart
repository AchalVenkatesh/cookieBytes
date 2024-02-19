// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? ontap;
  final String text;
  const MyButton({super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(6)),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
        fontSize: 16),
      )),
    );
  }
}
