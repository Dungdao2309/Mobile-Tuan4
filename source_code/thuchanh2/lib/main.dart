import 'package:flutter/material.dart';
import 'package:thuchanh2/Page/Page1.dart';
import 'package:thuchanh2/Page/Page2.dart';
import 'Page/MyHomePage.dart';
import 'Page/Page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const Page1(),
    );
  }
}