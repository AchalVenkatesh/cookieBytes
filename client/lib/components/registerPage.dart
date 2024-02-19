import 'package:flutter/material.dart';

import 'buttons.dart';
import 'text_field.dart';

class MyRegisterPage extends StatefulWidget {
  final Function()? ontap;
  const MyRegisterPage({super.key, required this.ontap});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    final confirmPasswordTextController = TextEditingController();
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
                    "Let's create an account for you!",
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

                //confirm password
                MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Confirm Password',
                    obscureText: true),

                const SizedBox(height: 20),

                //sign in button
                MyButton(ontap: () {}, text: 'Sign Up'),

                //goto register app
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: widget.ontap,
                        child: const Text(
                          "Login Now!",
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
