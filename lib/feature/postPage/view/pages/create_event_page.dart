import 'package:event_management/core/widgets/elevated_button_customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CreateEventPage extends HookWidget {
  const CreateEventPage({super.key});
  static String routePath = "/createeventpage";

  @override
  Widget build(BuildContext context) {
    /// Controllers
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final dateController = useTextEditingController();
    final timeController = useTextEditingController();

    ///price state
    final selectedPrice = useState<double>(100.0);
    const minPrice = 100.0;
    const maxPrice = 1000.0;
    final attendeesCount = useState<int>(100);
    final category = useState<String>('Select Category');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Image placeholder
            Center(
              child: GestureDetector(
                onTap: () {
                  // Logic for selecting an image
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title TextField
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Color(0xff246afd)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff246afd)),
                ),
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),

            // Description TextField
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                floatingLabelStyle: TextStyle(color: Color(0xff246afd)),
                labelText: 'Description',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.grey),
                    ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff246afd)),
                ),
              ),
              maxLength: 256,
              maxLines: 4,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
            ),
            const SizedBox(height: 8),

            /// add date picker
            TextField(
                readOnly: true,
                controller: dateController,
                decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: Color(0xff246afd)),
                    labelText: 'Date',
                    border: InputBorder.none),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (selectedDate != null && context.mounted) {
                    final formattedDate = MaterialLocalizations.of(context)
                        .formatCompactDate(selectedDate);
                    // dateController.text = selectedDate.toString().split(' ')[0];
                    dateController.text = formattedDate;
                  }
                }),
            const SizedBox(height: 8),

            /// add time picker
            TextField(
              controller: timeController,

              decoration: const InputDecoration(
                  floatingLabelStyle: TextStyle(color: Color(0xff246afd)),
                  labelText: 'Time',
                  border: InputBorder.none),
              readOnly: true, // Prevent manual input
              onTap: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selectedTime != null && context.mounted) {
                  final formattedTime = MaterialLocalizations.of(context)
                      .formatTimeOfDay(selectedTime);
                  timeController.text = formattedTime; // Set the formatted time
                }
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Select Price : \$ ${selectedPrice.value.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Slider(
              activeColor: const Color(0xff246afd),
              value: selectedPrice.value,
              min: minPrice,
              max: maxPrice,
              divisions: 100, // Number of steps on the slider
              label: '\$${selectedPrice.value.toStringAsFixed(2)}',
              onChanged: (value) {
                selectedPrice.value = value;
                // Notify the parent widget
              },
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                const Text("Attendees Count : "),
                IconButton(
                  onPressed: () {
                    if (attendeesCount.value > 0) {
                      attendeesCount.value -= 50;
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  ' ${attendeesCount.value}',
                  // style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    attendeesCount.value += 50;
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Category Dropdown
            DropdownButton<String>(
              focusColor: Colors.transparent,
              dropdownColor: Colors.white,
              elevation: 1,
              style: const TextStyle(color: Colors.black),
              underline: const SizedBox(),
              autofocus: false,
              isDense: true,
              value: category.value,
              onChanged: (value) {
                if (value != null) {
                  category.value = value;
                }
              },
              items: <String>[
                'Select Category',
                'Music',
                'Sports',
                'Technology'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            const SizedBox(height: 8),
            ElevatedButtonCustomizedWidget(
              onPressed: () {},
              text: "Post Event",
              foregroundColor: Colors.white,
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
