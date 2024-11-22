import 'package:event_management/feature/homePage/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventDetailsPage extends HookConsumerWidget {
  final EventModel event;
  const EventDetailsPage({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Description Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              child: Image(image: AssetImage("assets/images/user.jpg")),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: Text("${event.name} ${event.location}")),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Description"),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Expanded(child: Text(event.description)),
            ),
            const SizedBox(height: 16),

            ///Event Location in google Api Integration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(event.location),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
          ),
          onPressed: () {
            /// Add to cart

            context.push("/cartpage");
          },
          child: const Text("Book Now"),
        ),
      ),
    );
  }
}
