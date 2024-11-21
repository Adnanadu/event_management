import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.keyboardType,
    this.readOnly, required bool enabled,
  });
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      onTap: onTap,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
    );
  }
}
