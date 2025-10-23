import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
          child: Column(
            children: [
              Image.asset(
                  'assets/img/logoUTH.jpg',
                  width: 100,
                  height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10,),
              const Text(
                "UTH SmartTasks",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

