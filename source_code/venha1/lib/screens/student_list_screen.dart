// lib/screens/student_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/library_provider.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LibraryProvider>();
    final allStudents = provider.allStudents;

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Sinh viên')),
      body: ListView.builder(
        itemCount: allStudents.length,
        itemBuilder: (context, index) {
          final student = allStudents[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('ID: ${student.id}'),
            leading: const Icon(Icons.person_outline),
          );
        },
      ),
    );
  }
}