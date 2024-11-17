import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Define your line path here
    path.moveTo(0, size.height / 2); // Start from the middle-left
    path.lineTo(size.width,
        size.height / 2); // Draw a straight line to the middle-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
