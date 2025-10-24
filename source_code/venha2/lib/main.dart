import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/password_reset_controller.dart';

// *** THAY ĐỔI Ở ĐÂY ***
// Bỏ các tiền tố số khỏi đường dẫn import
import 'screens/forgot_password_screen.dart';
import 'screens/verify_code_screen.dart';
import 'screens/create_new_password_screen.dart';
import 'screens/confirm_screen.dart';
// *** KẾT THÚC THAY ĐỔI ***

void main() {
  runApp(
    // 3. Cung cấp Controller cho toàn bộ cây widget con
    ChangeNotifierProvider(
      create: (context) => PasswordResetController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTasks Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Định nghĩa style chung cho button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Định nghĩa style chung cho text field
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
      // 1. Màn hình bắt đầu
      initialRoute: '/',
      // 2. Định nghĩa các đường dẫn (routes)
      // (Phần này không cần thay đổi)
      routes: {
        '/': (context) => const ForgotPasswordScreen(),
        '/verify': (context) => const VerifyCodeScreen(),
        '/create_password': (context) => const CreateNewPasswordScreen(),
        '/confirm': (context) => const ConfirmScreen(),
      },
    );
  }
}