import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final fullNameController = useTextEditingController(text: "John Doe");
    final nicknameController = useTextEditingController(text: "Johnny");
    final dateOfBirthController = useTextEditingController(text: "1990-01-01");
    final emailController =
        useTextEditingController(text: "john.doe@example.com");
    final phoneController = useTextEditingController(text: "1234567890");

    // Editable state
    final isEditing = useState(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(isEditing.value ? Icons.check : Icons.edit,
                color: Colors.black),
            onPressed: () {
              isEditing.value = !isEditing.value;
              if (!isEditing.value) {
                // Save changes logic here
              }
            },
          ),
        ],
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
                  child: const Icon(Icons.person, color: Colors.blue, size: 50),
                ),
              ),
              const SizedBox(height: 24),

              // Full Name Field
              buildProfileField(
                label: "Full Name",
                controller: fullNameController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 16),

              // Nickname Field
              buildProfileField(
                label: "Nickname",
                controller: nicknameController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 16),

              // Date of Birth Field
              buildProfileField(
                label: "Date of Birth",
                controller: dateOfBirthController,
                isEditing: isEditing.value,
                onTap: isEditing.value
                    ? () async {
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
                      }
                    : null,
              ),
              const SizedBox(height: 16),

              // Email Field
              buildProfileField(
                label: "Email",
                controller: emailController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              buildProfileField(
                label: "Phone",
                controller: phoneController,
                isEditing: isEditing.value,
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
                onChanged: isEditing.value
                    ? (value) {
                        // Handle gender selection
                      }
                    : null,
              ),
              const SizedBox(height: 24),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if filled then continue to home page
                    // context.push("homepage");
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label),
        const SizedBox(height: 8),
        isEditing
            ? TextField(
                controller: controller,
                onTap: onTap,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                    // border: Border.all(color: Colors.grey),
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
