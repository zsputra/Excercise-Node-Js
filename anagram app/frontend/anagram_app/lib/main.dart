import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "anagram app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          child: Center(
            child: Text("Welcome to Angram Play"),
          ),
        ),
      ),
    );
  }
}
