// @dart = 2.8
import 'package:flutter/material.dart';
import 'package:flutter_kick_starter/squad_board/presentation/screen/dashbpard_page_widget.dart';

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
