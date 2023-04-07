import 'package:flutter/material.dart';
import 'package:test_app/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var mainTheme = ThemeData.light();
  var darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
