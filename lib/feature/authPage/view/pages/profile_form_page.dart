import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:event_management/feature/authPage/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ProfileFormPage extends HookWidget {
  const ProfileFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final fullNameController = useTextEditingController();
    final nicknameController = useTextEditingController();
    final dateOfBirthController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();

    // State to track if the full name is filled
    final isFullNameFilled = useState(false);

    // Listener to update the state when the full name changes
    useEffect(() {
      void listener() {
        isFullNameFilled.value = fullNameController.text.isNotEmpty;
      }

      fullNameController.addListener(listener);
      return () => fullNameController.removeListener(listener);
    }, [fullNameController]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Fill Your Profile",
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              GestureDetector(
                onTap: () {
                  // Handle profile picture change
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.edit, color: Colors.blue, size: 24),
                ),
              ),
              const SizedBox(height: 24),

              // Full Name Field
              TextFieldWidget(
                enabled: true,
                controller: fullNameController,
                labelText: "Full Name",
              ),
              const SizedBox(height: 16),

              // Nickname Field
              TextFieldWidget(
                enabled: true,
                controller: nicknameController,
                labelText: "Nickname",
              ),

              const SizedBox(height: 16),

              // Date of Birth Field
              TextFieldWidget(
                enabled: true,
                controller: dateOfBirthController,
                labelText: "Date of Birth",
                suffixIcon: const Icon(Icons.calendar_today),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  // Open date picker
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    dateOfBirthController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
                readOnly: true,
              ),

              const SizedBox(height: 16),

              // Email Field
              TextFieldWidget(
                enabled: true,
                controller: emailController,
                labelText: "Email",
                suffixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              TextFieldWidget(
                enabled: true,
                controller: phoneController,
                labelText: "Phone",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "+ 91",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                items: ["Male", "Female"]
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Handle gender selection
                },
              ),
              const SizedBox(height: 24),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonCustomizedWidget(
                  onPressed: () {
                    // if filled then continue to home page
                    context.push("/homepage");
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
