import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/password_reset_controller.dart';
import 'package:pinput/pinput.dart'; // <-- 1. Import thư viện

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _onVerifyPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() { _isLoading = true; });

      // 1. Lấy controller
      final controller = context.read<PasswordResetController>();

      // 2. Gọi logic
      final bool success = await controller.verifyCode(_pinController.text);

      setState(() { _isLoading = false; });

      if (mounted) {
        if (success) {
          // 3. Điều hướng nếu đúng
          Navigator.of(context).pushNamed('/create_password');
        } else {
          // 4. Báo lỗi nếu sai
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid code. Please try again.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dùng context.watch() để lấy email TỪ controller và hiển thị
    final email = context.watch<PasswordResetController>().email;

    // 2. Định nghĩa style cho ô Pinput
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(size: 80),
              const SizedBox(height: 10),
              const Text(
                'SmartTasks',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                'Verify Code',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(textAlign: TextAlign.center,'Enter the the code we just sent you on your registered Email: $email',style: TextStyle(fontSize: 16),),
              const SizedBox(height: 30),

              // *** 3. THAY THẾ CHỖ NÀY ***
              // Thay vì TextFormField, dùng Pinput
              Pinput(
                controller: _pinController,
                length: 5, // <-- 5 ô, khớp với mã "12345"
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => _onVerifyPressed(), // Tự động submit khi nhập đủ
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the code';
                  }
                  return null;
                },
              ),
              // *** KẾT THÚC THAY THẾ ***

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
                onPressed: _isLoading ? null : _onVerifyPressed,
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