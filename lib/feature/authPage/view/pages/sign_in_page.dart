import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:event_management/feature/authPage/view/widgets/via_social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final rememberMe = useState(false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),

        /// to center the content
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 32px starting space
              const SizedBox(height: 32),
              const Icon(Icons.podcasts, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Login to Your Account',
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
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
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Implement forgot password logic
                        context.push("/forgotpassword");
                      },
                      child: const Text(
                        textAlign: TextAlign.right,
                        'Forgot the password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButtonCustomizedWidget(
                onPressed: () async {
                  await context.push("/otpcode");
                },
                text: 'Sign in',
              ),
              const SizedBox(height: 24),
              const Text('or continue with',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),

              /// Add via social media widget
              const ViaSocialMediaWidget(),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  context.push("/signup");
                },
                child: const Text(
                  "Don't have an account? Sign up",
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
