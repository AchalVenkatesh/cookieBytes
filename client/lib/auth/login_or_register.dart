import 'package:counter_app/components/registerPage.dart';
import 'package:counter_app/pages/loginPage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the login page
  bool showloginPage = true;

  //toggle b/w the 2 pages
  void togglePages() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage == true) {
      return loginPage(ontap: togglePages);
    } else {
      return MyRegisterPage(ontap: togglePages);
    };
  }
}
