import 'package:event_management/main.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackBar(String message) {
    EventManagementApp.scaffoldMessengerKey.currentState!
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
