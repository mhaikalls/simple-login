import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taspen_kp/constants.dart';
import 'package:taspen_kp/methods/auth_methods.dart';
import 'package:taspen_kp/screens/auth/login_screen.dart';
import 'package:taspen_kp/widgets/input_field.dart';

import '../home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Halaman Daftar",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  InputField(
                    hintText: "Username",
                    controller: _usernameController,
                  ),
                  const SizedBox(
                    height: 25,
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
                            _passwordController.text.isEmpty ||
                            _usernameController.text.isEmpty) {
                          showFlushBar(context, "Error",
                              "Email, Username or Password can't be empty");
                        } else {
                          _signUp(_usernameController.text,
                              _emailController.text, _passwordController.text);
                        }
                      },
                      child: const Text("Daftar")),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(children: [
                    const Text("Sudah punya akun?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text("Login")),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(String email, String password, String username) async {
    setState(() {
      showFlushBar(context, "wait", "Processing");
    });
    String result = await AuthMethods()
        .signUpUser(UserName: username, email: email, password: password);
    setState(() {
      if (result == "Success") {
        showFlushBar(context, result, "Successfully Signed Up");
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        });
      } else {
        showFlushBar(context, "Error Occured", result);
      }
    });
  }
}
