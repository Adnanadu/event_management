import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswordPage extends HookWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final newPasswordVisible = useState(false);
    final confirmPasswordVisible = useState(false);
    final rememberMe = useState(false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Create New Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Illustration Image (Placeholder)
            const Icon(Icons.phone_android, size: 100, color: Colors.blue),
            const SizedBox(height: 10),
            const Icon(Icons.check_circle, size: 60, color: Colors.blue),
            const SizedBox(height: 30),

            // Title Text
            const Text(
              'Create Your New Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // New Password TextField
            TextField(
              controller: newPasswordController,
              obscureText: !newPasswordVisible.value,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    newPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    newPasswordVisible.value = !newPasswordVisible.value;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Confirm Password TextField
            TextField(
              controller: confirmPasswordController,
              obscureText: !confirmPasswordVisible.value,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    confirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    confirmPasswordVisible.value =
                        !confirmPasswordVisible.value;
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Remember Me Checkbox
            Row(
              children: [
                Checkbox(
                  value: rememberMe.value,
                  onChanged: (value) {
                    rememberMe.value = value ?? false;
                  },
                ),
                const Text('Remember me'),
              ],
            ),
            const SizedBox(height: 30),

            // Continue Button
            // ElevatedButton(
            //   onPressed: () {
            //     // Add logic for continuing with password
            //     context.pushNamed("intro");
            //   },
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(double.infinity, 56),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //   ),
            //   child: const Text(
            //     'Continue',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),
            ElevatedButtonCustomizedWidget(
              onPressed: () {
                context.pushNamed("homepage");
              },
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
