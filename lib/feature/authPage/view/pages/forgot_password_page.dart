import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // State to track selected contact method
    final selectedMethod = useState<String>("SMS");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Forgot Password",
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Illustration
              Image.network(
                'https://media.istockphoto.com/id/1412282189/photo/lock-network-technology-concept.jpg?s=612x612&w=0&k=20&c=hripuxLs9pS_7Ln6YWQR-Ow2_-BU5RdQ4vOY8s1q1iQ=', // Replace with your actual asset path
                height: 200,
              ),
              const SizedBox(height: 40),

              // Instruction Text
              const Text(
                "Select which contact details should we use to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),

              // SMS Option
              GestureDetector(
                onTap: () => selectedMethod.value = "SMS",
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedMethod.value == "SMS"
                          ? Colors.blue
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.message, color: Colors.blue, size: 30),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("via SMS:",
                                style: TextStyle(color: Colors.grey)),
                            Text("+91 111 ******99",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email Option
              GestureDetector(
                onTap: () => selectedMethod.value = "Email",
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selectedMethod.value == "Email"
                          ? Colors.blue
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue, size: 30),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("via Email:",
                                style: TextStyle(color: Colors.grey)),
                            Text("and***ley@yourdomain.com",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Continue Button
              SizedBox(
                width: double.infinity,
                // child: ElevatedButton(
                //   onPressed: () {
                //     // Handle continue action based on selectedMethod.value
                //     //pass here in extra parameters inside mobile number or mail
                //     // context.push("/otpcode");
                //     context.push("/newpassword");
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue,
                //     padding: const EdgeInsets.symmetric(vertical: 16),
                //   ),
                //   child: const Text("Continue"),
                // ),
                child: ElevatedButtonCustomizedWidget(
                  onPressed: () {
                    // Handle continue action based on selectedMethod.value
                    //pass here in extra parameters inside mobile number or mail
                    // context.push("/otpcode");
                    context.push("/newpassword");
                  },
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
