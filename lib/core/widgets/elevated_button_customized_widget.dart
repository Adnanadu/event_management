import 'package:flutter/material.dart';

class ElevatedButtonCustomizedWidget extends StatelessWidget {
  const ElevatedButtonCustomizedWidget({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.isLastPage,
    required this.text,
    this.backgroundColor,
  });
  final void Function()? onPressed;
  final Color? foregroundColor;
  final bool? isLastPage;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        foregroundColor: foregroundColor ?? Colors.white,
        backgroundColor: backgroundColor ?? const Color(0xff246afd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(text),
    );
  }
}
