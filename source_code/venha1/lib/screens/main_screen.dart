import 'package:flutter/material.dart';
import 'management_screen.dart';
import 'book_list_screen.dart';
import 'student_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ManagementScreen(),
    const BookListScreen(),
    const StudentListScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Quản lý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'DS Sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Sinh viên',
          ),
        ],
      ),
    );
  }
}