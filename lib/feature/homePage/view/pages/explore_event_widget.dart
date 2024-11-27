import 'package:event_management/feature/homePage/controller/event_controller_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreEventWidget extends ConsumerWidget {
  const ExploreEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventProvider = ref.watch(eventStateProvider);
    return StreamBuilder(
      stream: Stream.value(null),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // itemCount: ref.watch(eventProvider).length,
            itemCount: eventProvider.events.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        /// navigate to event description page
                        // final event = ref.read(eventProvider)[index];
                        // context.push('/eventdetails', extra: event);
                      },
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
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () async {
                          ///when i click this button it check if it is favorite or not
                          ///if it is favorite then remove favorite
                          final eventId = eventProvider
                              .events[index].id; // Get the event ID
                          if (eventProvider.favorites.contains(eventId)) {
                            ref
                                .read(eventStateProvider.notifier)
                                .removeFavorite(eventId);
                          } else {
                            ref
                                .read(eventStateProvider.notifier)
                                .addFavorite(eventId);
                          }
                        },

                        ///when i tap this icon, if it is change from favorite icon to favrite outline
                        icon: eventProvider.favorites
                                .contains(eventProvider.events[index].id)
                            ? const Icon(Icons.favorite,
                                color: Colors.red) // Change color to red
                            : const Icon(Icons.favorite_border),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(eventProvider.events[index].name),
                              Text(eventProvider.events[index].location),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// display date and time from event model
                                  Text(eventProvider.events[index].date),
                                  Text(eventProvider.events[index].time),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
