import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:event_management/feature/authPage/controller/auth_controller.dart';
import 'package:event_management/feature/authPage/view/pages/sign_up.dart';
import 'package:event_management/feature/authPage/view/widgets/via_social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  static const routePath = '/signin';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);
    final rememberMe = useState(false);

    /// callback to execute when the sign in button is pressed
    void onSignUpButtonPressed() {
      context.go(SignUpPage.routePath);
    }

    /// callback to execute when the sign in button is pressed

    void onLogInButtonPressed() {
      final email = emailController.text;
      final password = passwordController.text;
      ref.read(authControllerProvider.notifier).login(
            email: email,
            password: password,
          );
    }

    ///callback to execute when the forgot password in button is pressed
    void onForgotPasswordButtonPressed() {
      final email = emailController.text;
      ref.read(authControllerProvider.notifier).forgotPassword(email: email);
    }

    ///
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
                      onTap: onForgotPasswordButtonPressed,
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
                onPressed: onLogInButtonPressed,
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
                onTap: onSignUpButtonPressed,
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
