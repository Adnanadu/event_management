import 'package:event_management/feature/profile_page/view/widgets/profile_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final fullNameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final dateOfBirthController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();
    final gender = useState<String>('Select Gender');

    // Editable state
    final isEditing = useState(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pushReplacement("/homepage"),
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
              ProfileField(
                label: "Full Name",
                controller: fullNameController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 8),
              ProfileField(
                label: "User Name",
                controller: usernameController,
                isEditing: isEditing.value,
              ),

              const SizedBox(height: 8),

              // Date of Birtgh Field
              ProfileField(
                label: "Date of Birth",
                controller: dateOfBirthController,
                isEditing: isEditing.value,
                onTap: isEditing.value
                    ? () async {
                        final selectedDOB = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1930),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDOB != null && context.mounted) {
                          ///formated DOB
                          dateOfBirthController.text =
                              MaterialLocalizations.of(context)
                                  .formatCompactDate(selectedDOB);
                        }
                      }
                    : null,
              ),
              const SizedBox(height: 8),
              // Email Field
              ProfileField(
                label: "Email",
                controller: emailController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 8),

              // Phone Number Field
              ProfileField(
                label: "Phone Number",
                controller: phoneController,
                isEditing: isEditing.value,
              ),
              const SizedBox(height: 8),
              isEditing.value
                  ? DropdownButtonFormField<String>(
                      focusColor: Colors.transparent,
                      dropdownColor: Colors.white,
                      elevation: 1,
                      style: const TextStyle(color: Colors.black),
                      autofocus: false,
                      isDense: true,
                      value: gender.value,
                      onChanged: (value) {
                        if (value != null) {
                          gender.value = value;
                        }
                      },
                      items: <String>[
                        'Select Gender',
                        'Male',
                        'Female',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                    )
                  : Container(
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
                          Text("Gender  :   ${gender.value}"),
                        ],
                      ),
                    ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
