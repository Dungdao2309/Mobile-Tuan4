import 'package:flutter/foundation.dart';
import '../models/book.dart';
import '../models/student.dart';

class LibraryProvider extends ChangeNotifier {
  final List<Book> _allBooks = [
    Book(id: 'b001', title: 'Sách 01 - Lập trình Dart', author: 'Author A'),
    Book(id: 'b002', title: 'Sách 02 - Flutter nâng cao', author: 'Author B'),
    Book(id: 'b003', title: 'Sách 03 - Cấu trúc dữ liệu', author: 'Author C'),
    Book(id: 'b004', title: 'Sách 04 - OOP Design', author: 'Author D'),
  ];
  final List<Student> _allStudents = [
    Student(id: 'sv001', name: 'Nguyễn Văn A'),
    Student(id: 'sv002', name: 'Nguyễn Thị B'),
    Student(id: 'sv003', name: 'Nguyễn Văn C'),
  ];
  final Map<String, List<String>> _borrowedRecords = {
    'sv001': ['b001', 'b002'],
    'sv002': ['b003'],
    'sv003': [],
  };
  late Student _currentStudent;
  LibraryProvider() {
    _currentStudent = _allStudents.first;
  }
  List<Student> get allStudents => _allStudents;
  Student get currentStudent => _currentStudent;
  List<Book> get borrowedBooksForCurrentStudent {
    final bookIds = _borrowedRecords[_currentStudent.id] ?? [];
    return _allBooks.where((book) => bookIds.contains(book.id)).toList();
  }
  List<Book> get availableBooks {
    final allBorrowedIds = _borrowedRecords.values.expand((ids) => ids).toSet();
    return _allBooks.where((book) => !allBorrowedIds.contains(book.id)).toList();
  }
  void changeCurrentStudent(Student newStudent) {
    _currentStudent = newStudent;
    notifyListeners();
  }
  void borrowBook(Book book) {
    if (!availableBooks.contains(book)) return;

    _borrowedRecords[_currentStudent.id]?.add(book.id);
    notifyListeners();
  }
  void returnBook(Book book) {
    _borrowedRecords[_currentStudent.id]?.remove(book.id);
    notifyListeners();
  }
}