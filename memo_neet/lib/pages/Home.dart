import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  Home_state createState() => Home_state();
}

class Home_state extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }
}
