// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:counter_app/components/buttons.dart';
import 'package:counter_app/components/text_field.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  final Function()? ontap;
  const loginPage({super.key, required this.ontap});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Image.asset(
                  'lib/images/ethereum-logo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 25,
                  width: 25,
                ),

                //welcome back message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Welcome back, You've been missed!",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                //email textfield
                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false),

                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obscureText: true),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //sign in button
                MyButton(ontap: () {}, text: 'Sign In'),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    Image.asset(
                      'lib/images/free-google-160-189824.png',
                      height: 30,
                    ),

                    const SizedBox(
                      width: 14,
                    ),
                    //apple button
                    Image.asset(
                      'lib/images/png-clipart-apple-logo-svg-company-logo.png',
                      height: 38,
                    )
                  ],
                ),

                //goto register app
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: widget.ontap,
                        child: const Text(
                          "Register Now!",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
