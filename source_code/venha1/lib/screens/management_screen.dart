// lib/screens/management_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../models/student.dart';
import '../providers/library_provider.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryProvider>(
      builder: (context, provider, child) {
        final Student student = provider.currentStudent;
        final List<Book> borrowedBooks = provider.borrowedBooksForCurrentStudent;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Hệ thống Quản lý Thư viện'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sinh viên',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          student.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Gọi hàm hiển thị Dialog chọn sinh viên
                        _showChangeStudentDialog(context, provider);
                      },
                      child: const Text('Thay đổi'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Danh sách sách',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: borrowedBooks.isEmpty
                        ? const Center(
                      child: Text(
                        'Bạn chưa mượn quyển sách nào.\nNhấn "Thêm" để bắt đầu hành trình đọc sách!',
                        textAlign: TextAlign.center,
                      ),
                    )
                        : ListView.builder(
                      itemCount: borrowedBooks.length,
                      itemBuilder: (context, index) {
                        final book = borrowedBooks[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: CheckboxListTile(
                            title: Text(book.title),
                            value: true,
                            onChanged: (bool? newValue) {
                              if (newValue == false) {
                                provider.returnBook(book);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showBorrowBookDialog(context, provider);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Thêm'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showChangeStudentDialog(BuildContext context, LibraryProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chọn sinh viên'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.allStudents.length,
              itemBuilder: (context, index) {
                final student = provider.allStudents[index];
                return ListTile(
                  title: Text(student.name),
                  onTap: () {
                    provider.changeCurrentStudent(student);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showBorrowBookDialog(BuildContext context, LibraryProvider provider) {
    final availableBooks = provider.availableBooks;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Mượn sách mới'),
          content: SizedBox(
            width: double.maxFinite,
            child: availableBooks.isEmpty
                ? const Text('Đã mượn hết sách có sẵn.')
                : ListView.builder(
              shrinkWrap: true,
              itemCount: availableBooks.length,
              itemBuilder: (context, index) {
                final book = availableBooks[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () {
                    provider.borrowBook(book);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}