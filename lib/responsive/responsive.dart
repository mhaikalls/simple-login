import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taspen_kp/constants.dart';

class Responsive extends StatefulWidget {
  final Widget mobileScreen;
  final Widget webScreen;
  const Responsive(
      {Key? key, required this.mobileScreen, required this.webScreen})
      : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 900) {
        isMobile = true;
        isWeb = false;
        return widget.mobileScreen;
      } else {
        isWeb = true;
        isMobile = false;
        return widget.webScreen;
      }
    });
  }
}
