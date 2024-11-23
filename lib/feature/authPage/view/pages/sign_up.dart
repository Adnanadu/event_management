import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:event_management/feature/authPage/controller/auth_controller.dart';
import 'package:event_management/feature/authPage/view/pages/profile_form_page.dart';
import 'package:event_management/feature/authPage/view/pages/sign_in_page.dart';
import 'package:event_management/feature/authPage/view/widgets/via_social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  static const routePath = '/signup';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Functions
    // void navigateToSignInPage() {
    //   context.go('/sign_in');
    // }

    ///Controllers
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    ///value holder
    final isPasswordVisible = useState(false);
    final rememberMe = useState(false);

    ///Functions
    // void onsignInButtonPressed() {
    //   context.go(ProfileFormPage.routePath);
    // }

    void onsignUpButtonPressed() {
      if (formKey.currentState!.validate()) {
        ref.read(authControllerProvider.notifier).signUp(
              email: emailController.text,
              password: passwordController.text,
            );
        // context.go(ProfileFormPage.routePath);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                TextFormField(
                  validator:
                      ref.read(authControllerProvider.notifier).isValidEmail,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: ref
                      .read(authControllerProvider.notifier)
                      .validatePassword,
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
                TextFormField(
                  validator: ref
                      .read(authControllerProvider.notifier)
                      .validatePassword,
                  controller: confirmPasswordController,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                ElevatedButtonCustomizedWidget(
                  onPressed: onsignUpButtonPressed,
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
                    context.go(SignInPage.routePath);
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
      ),
    );
  }
}
