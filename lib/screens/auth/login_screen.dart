import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taspen_kp/constants.dart';
import 'package:taspen_kp/screens/auth/signup_screen.dart';
import 'package:taspen_kp/widgets/input_field.dart';

import '../../methods/auth_methods.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: isWeb ? width / 4 : width / 1.2,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Halaman Login",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      InputField(
                        hintText: "Email",
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InputField(
                        hintText: "Password",
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              showFlushBar(context, "Error",
                                  "Email or Password can't be empty");
                            } else {
                              _login(
                                  _usernameController.text,
                                  _emailController.text,
                                  _passwordController.text);
                            }
                          },
                          child: Text("Login")),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                  Column(children: [
                    const Text("Tidak mempunyai akun?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text("Daftar")),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(String email, String password, String username) async {
    setState(() {
      showFlushBar(context as BuildContext, "wait", "Processing");
    });
    String result =
        await AuthMethods().loginUser(email: email, password: password);
    setState(() {
      if (result == "Success") {
        showFlushBar(context as BuildContext, result, "Successfully Logged In");
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(context as BuildContext,
              MaterialPageRoute(builder: (context) => Homescreen()));
        });
      } else {
        showFlushBar(context as BuildContext, "Error Occured", result);
      }
    });
  }
}
