// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/library_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    // Bọc ứng dụng trong ChangeNotifierProvider
    // để các widget con có thể truy cập LibraryProvider
    ChangeNotifierProvider(
      create: (context) => LibraryProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Thư viện',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}