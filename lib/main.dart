import 'package:flutter/material.dart';
import 'package:mobx_project/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mobx Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyanAccent[700],
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.cyanAccent[700],
        ),
      ),
      home: LoginScreen(),
    );
  }
}
