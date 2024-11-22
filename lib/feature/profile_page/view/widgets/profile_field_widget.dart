import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback? onTap;

  const ProfileField({
    super.key,
    required this.label,
    required this.controller,
    required this.isEditing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        isEditing
            ? TextField(
                controller: controller,
                onTap: onTap,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  floatingLabelStyle: const TextStyle(color: Color(0xff246afd)),
                  labelText: label,
                ),
              )
            : GestureDetector(
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$label  :   ${controller.text}"),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
