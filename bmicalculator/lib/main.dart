import 'package:flutter/material.dart';

// Screen
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff130f60),
        accentColor: Color(0xff1e152f),
        canvasColor: Color(0xff0d0b20),
      ),
      home: HomeScreen(),
    );
  }
}
