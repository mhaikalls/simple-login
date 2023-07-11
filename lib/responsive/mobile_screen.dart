import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:taspen_kp/screens/auth/login_screen.dart';
import 'package:taspen_kp/screens/auth/signup_screen.dart';
import 'package:taspen_kp/widgets/input_field.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => MobileScreenState();
}

class MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
