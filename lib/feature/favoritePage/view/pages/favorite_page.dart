import 'package:event_management/feature/homePage/controller/event_controller_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoritePage extends HookConsumerWidget {
  const FavoritePage({super.key});
  static String routePath = "/favoritepage";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isFavorite = ref.watch(isFavoriteProvider);
    final isFavoriteProvider = ref.watch(eventStateProvider);
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
        itemCount: isFavoriteProvider.favorites.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    /// navigate to event description page
                    // final event = isFavoriteProvider.favorites[index];
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
                      onPressed: () {
                        /// when pressed remove from favorites list
                        ref.read(eventStateProvider.notifier).removeFavorite(
                            isFavoriteProvider.favorites[index]);
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )),
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
                      child: const Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(isFavoriteProvider.favorites[index].name),
                          // Text(isFavoriteProvider.favorites[index].location),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// display date and time from event model
                              // Text(ref.read(eventProvider)[index].date),
                              // Text(ref.read(eventProvider)[index].time),
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
