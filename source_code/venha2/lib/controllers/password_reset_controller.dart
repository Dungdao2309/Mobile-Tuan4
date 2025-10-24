import 'package:flutter/foundation.dart';

// 1. TÍNH KẾ THỪA:
// Lớp này kế thừa từ ChangeNotifier để có khả năng thông báo
// cho UI (View) khi dữ liệu của nó thay đổi.
class PasswordResetController extends ChangeNotifier {

  // 2. TÍNH ĐÓNG GÓI (Encapsulation):
  // Các biến state (trạng thái) được đặt là private (_).
  // Bên ngoài không thể truy cập trực tiếp.
  String _email = '';
  String _newPassword = '';

  // 3. TÍNH ĐÓNG GÓI (Encapsulation):
  // Cung cấp các "getter" public để bên ngoài (UI) có thể đọc dữ liệu.
  String get email => _email;
  String get newPassword => _newPassword;

  // 4. TÍNH TRỪU TƯỢNG (Abstraction):
  // Đây là các "hành vi" (methods) của class.
  // UI chỉ cần gọi updateEmail(), không cần biết bên trong làm gì.
  void updateEmail(String email) {
    _email = email;
    // Thông báo cho các widget đang "lắng nghe" để chúng build lại
    notifyListeners();
  }

  void updatePassword(String password) {
    _newPassword = password;
    notifyListeners();
  }

  // Một phương thức logic nghiệp vụ (ví dụ: gọi API)
  // UI chỉ cần gọi sendVerificationCode() và chờ kết quả.
  Future<bool> sendVerificationCode() async {
    // Giả lập việc gọi API mất 1 giây
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Đã gửi mã xác thực tới: $_email');
    // Giả sử luôn thành công
    return true;
  }

  Future<bool> verifyCode(String code) async {
    await Future.delayed(const Duration(seconds: 1));

    // *** THAY ĐỔI Ở ĐÂY ***
    // Giả lập mã đúng là "12345" theo yêu cầu của bạn
    if (code == '12345') {
      debugPrint('Xác thực mã thành công');
      return true;
    }

    debugPrint('Xác thực mã thất bại');
    return false;
  }

  Future<bool> resetPassword() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Đã reset mật khẩu cho: $_email với pass: $_newPassword');
    return true;
  }

  // Phương thức dọn dẹp state khi flow kết thúc
  void clearState() {
    _email = '';
    _newPassword = '';
    // Không cần notifyListeners() vì chúng ta sẽ điều hướng về trang chủ
  }
}