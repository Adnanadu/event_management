import 'package:event_management/core/utils/snackbar_utils/snackbar_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  ///signup
  static Future<void> signUp(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  ///login
  static Future<void> login(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  ///logout
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
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
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
