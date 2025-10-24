// lib/screens/book_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/library_provider.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();

    final availableBooks = provider.availableBooks;

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Sách có sẵn')),
      body: ListView.builder(
        itemCount: availableBooks.length,
        itemBuilder: (context, index) {
          final book = availableBooks[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            leading: const Icon(Icons.book_online),
          );
        },
      ),
    );
  }
}