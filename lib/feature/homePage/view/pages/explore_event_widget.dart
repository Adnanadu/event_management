import 'package:event_management/feature/homePage/controller/event_notifier_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isFavoriteProvider = StateProvider<List>((ref) {
  return [];
});

class ExploreEventWidget extends HookConsumerWidget {
  const ExploreEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider.notifier).state;
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
            itemCount: ref.watch(eventProvider).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        /// navigate to festival detail page
                        context.push('/festival');
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
                              if (isFavorite.contains(index)) {
                                ref
                                    .read(isFavoriteProvider.notifier)
                                    .state
                                    .remove(index);
                                // isFavorite.remove(index);
                              } else {
                                ref
                                    .read(isFavoriteProvider.notifier)
                                    .state
                                    .add(index);
                                // isFavorite.add(index);
                              }
                            },
                            icon: Icon(
                              ref
                                      .read(isFavoriteProvider.notifier)
                                      .state
                                      .contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red[600],
                            ))),
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
                              Text(ref.read(eventProvider)[index].name),
                              Text(ref.read(eventProvider)[index].location),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /// display date and time from event model
                                  Text(ref.read(eventProvider)[index].date),
                                  Text(ref.read(eventProvider)[index].time),
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
