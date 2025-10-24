import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/password_reset_controller.dart';

// Đây là một "Class" định nghĩa UI
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

// Đây là "State" của widget trên
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Hàm xử lý logic khi nhấn nút
  void _onNextPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() { _isLoading = true; });

      // 1. Lấy controller từ Provider (KHÔNG lắng nghe thay đổi)
      // Dùng context.read() bên trong một hàm
      final controller = context.read<PasswordResetController>();

      // 2. Gọi phương thức (Hành vi) của Controller
      controller.updateEmail(_emailController.text);
      await controller.sendVerificationCode();

      setState(() { _isLoading = false; });

      // 3. Điều hướng
      if (mounted) {
        Navigator.of(context).pushNamed('/verify');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/img/logo.jpg",height: 50,width: 50),
              const SizedBox(height: 10),
              const Text(
                'SmartTasks',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'Forgot Password?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(textAlign: TextAlign.center,'Enter your Email, we will send you a verification code.',style: TextStyle(fontSize: 16),),
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Your Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _isLoading ? null : _onNextPressed,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}