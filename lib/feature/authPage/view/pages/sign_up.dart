import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:event_management/feature/authPage/view/widgets/via_social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final rememberMe = useState(false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 32px starting space
              const SizedBox(height: 32),
              const Icon(Icons.podcasts, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Create New Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {
              //     // Implement sign-up logic
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blue,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //   ),
              //   child: const Center(
              //     child: Text(
              //       'Sign up',
              //       style: TextStyle(fontSize: 16, color: Colors.white),
              //     ),
              //   ),
              // ),
              ElevatedButtonCustomizedWidget(
                onPressed: () async {
                  // Implement sign-up logic
                  await context.push("/profileform");
                },
                text: 'Sign up',
              ),

              const SizedBox(height: 24),
              const Text('or continue with',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),

              ///  Add via social media widget
              const ViaSocialMediaWidget(),

              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  context.push("/signin");
                },
                child: const Text(
                  'Already have an account? Sign in',
                  style: TextStyle(color: Colors.blue),
                ),
              ),

              /// 24px space end of the page
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
