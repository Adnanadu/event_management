import 'package:event_management/core/utils/snackbar_utils/snackbar_utils.dart';
import 'package:event_management/feature/authPage/services/auth_services.dart';
import 'package:event_management/feature/authPage/view/pages/sign_in_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:event_management/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  void build() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        EventManagementApp.navigatorkey.currentContext!
            .go(SignInPage.routePath);
      } else {
        EventManagementApp.navigatorkey.currentContext!.go(HomePage.routePath);
      }
    });
  }

  ///validating email
  String? isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegex.hasMatch(value)) {
      return "invalid email Format";
    }
    return null;
  }

  /// validate Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  ///validate Confirm Password
  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password is required";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  /// login User
  Future<void> login({required String email, required String password}) async {
    try {
      await AuthServices.login(email: email, password: password);
      SnackBarUtils.showSnackBar("Login successful");
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  /// signup user
  Future<void> signUp({required String email, required String password}) async {
    try {
      await AuthServices.signUp(email: email, password: password);
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await AuthServices.logout();
      SnackBarUtils.showSnackBar("Logout successful");
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }
  /// forgot password
   Future<void> forgotPassword({required String email}) async {
    try {
      await AuthServices.forgotPassword(email: email);
      SnackBarUtils.showSnackBar("Password reset email sent successfully");
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }
}
