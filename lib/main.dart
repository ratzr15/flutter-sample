import 'package:flutter/material.dart';
import 'package:flutter_kick_starter/page/first_page/dashbpard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GSX Squad App",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: DashboardScreen(),
    );
  }
}
