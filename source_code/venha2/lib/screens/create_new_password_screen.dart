import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/password_reset_controller.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  void _onNextPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() { _isLoading = true; });
      final controller = context.read<PasswordResetController>();
      controller.updatePassword(_passController.text);
      await controller.resetPassword();
      setState(() { _isLoading = false; });
      if (mounted) {
        Navigator.of(context).pushNamed('/confirm');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                'Create new password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(textAlign: TextAlign.center,'Your new password must be different from previously used password.',style: TextStyle(fontSize: 16),),
              const SizedBox(height: 30),

              // *** 2. CẬP NHẬT TRƯỜNG PASSWORD ***
              TextFormField(
                controller: _passController,
                obscureText: _isPasswordObscured, // Dùng biến state
                decoration: InputDecoration( // Bỏ 'const'
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
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
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // *** 3. CẬP NHẬT TRƯỜNG CONFIRM PASSWORD ***
              TextFormField(
                controller: _confirmPassController,
                obscureText: _isConfirmPasswordObscured, // Dùng biến state
                decoration: InputDecoration( // Bỏ 'const'
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  // Thêm icon để xem mật khẩu
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      // Dùng setState để thay đổi trạng thái
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != _passController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
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