import 'package:flutter/material.dart';
import 'package:taspen_kp/screens/auth/login_screen.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreen();
}

class _WebScreen extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
