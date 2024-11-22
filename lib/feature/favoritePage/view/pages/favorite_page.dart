import 'package:event_management/feature/homePage/controller/event_notifier_controller.dart';
import 'package:event_management/feature/homePage/view/pages/explore_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoritePage extends HookConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => context.pop(),
        // ),
        title: const Text("Favorite"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ref.watch(isFavoriteProvider).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    /// navigate to event description page
                    final event = ref.read(eventProvider)[index];
                    context.push('/eventdetails', extra: event);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
