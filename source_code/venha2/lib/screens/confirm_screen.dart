import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/password_reset_controller.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  // Biến để theo dõi trạng thái ẩn/hiện mật khẩu
  bool _isPasswordObscured = true;

  void _onSubmitPressed(BuildContext context) {
    // 1. Dọn dẹp state trong controller
    context.read<PasswordResetController>().clearState();

    // 2. Quay về màn hình đầu tiên (xóa hết các màn hình cũ khỏi stack)
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PasswordResetController>();
    final email = controller.email;
    final newPassword = controller.newPassword;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            const Text(
              textAlign: TextAlign.center,
              'Confirm',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(textAlign: TextAlign.center,'We are here to help you!',style: TextStyle(fontSize: 16),),
            const SizedBox(height: 30),
            TextField(
              controller: TextEditingController(text: email),
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: TextEditingController(text: '12345'),
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Verification Code',
                prefixIcon: Icon(Icons.lock_open_outlined),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: TextEditingController(text: newPassword),
              readOnly: true,
              obscureText: _isPasswordObscured,
              decoration: InputDecoration( // Bỏ 'const'
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                // Thêm icon để xem mật khẩu
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    // Dùng setState để thay đổi trạng thái
                    setState(() {
                      _isPasswordObscured = !_isPasswordObscured;
                    });
                  },
                ),
              ),
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
              onPressed: () => _onSubmitPressed(context),
              child: const Text('Submit'), // Sửa "Summit" thành "Submit"
            ),
          ],
        ),
      ),
    );
  }
}