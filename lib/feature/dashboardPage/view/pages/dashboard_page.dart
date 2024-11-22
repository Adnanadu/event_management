import 'package:event_management/feature/homePage/controller/event_notifier_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
              // borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      onPressed: () {
                        ///edit event details
                      },
                      icon: isEditing.value
                          ? const Icon(Icons.done)
                          : const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        /// Event Delete from backend
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ]),
                  GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/user.jpg"),
                            fit: BoxFit.cover),
                      ),
                      height: 200,
                      width: double.infinity,
                    ),
                    onTap: () {
                      /// Select event image
                    },
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        // Expanded(child: Text("${event.name} ${event.location}")),
                      ],
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text("Description"),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    // child: Expanded(child: Text(event.description)),
                  ),

                  ///Event Location in google Api Integration
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    // child: Text(event.location),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
