import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("This is the Homes creen"),
    );
  }
}
