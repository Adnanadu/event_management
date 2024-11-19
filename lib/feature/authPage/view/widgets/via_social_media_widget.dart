import 'package:flutter/material.dart';

class ViaSocialMediaWidget extends StatelessWidget {
  const ViaSocialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook, color: Colors.blue),
          onPressed: () {
            // Implement Facebook sign-in logic
          },
        ),
        IconButton(
          icon: const Icon(Icons.g_mobiledata, color: Colors.red),
          onPressed: () {
            // Implement Google sign-in logic
          },
        ),
        IconButton(
          icon: const Icon(Icons.apple, color: Colors.black),
          onPressed: () {
            // Implement Apple sign-in logic
          },
        ),
      ],
    );
  }
}
