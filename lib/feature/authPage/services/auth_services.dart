import 'package:event_management/core/utils/snackbar_utils/snackbar_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  ///signup
  static Future<void> signUp(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  ///login
  static Future<void> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  ///logout
  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  ///Delete user
  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  /// get current user
  static User? getCurrentUserSync() {
    return FirebaseAuth.instance.currentUser;
  }
  /// forgot password
  static Future<void> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }
}
