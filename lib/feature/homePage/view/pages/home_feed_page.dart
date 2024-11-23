import 'package:event_management/feature/authPage/controller/auth_controller.dart';
import 'package:event_management/feature/homePage/controller/event_notifier_controller.dart';
import 'package:event_management/feature/homePage/view/pages/explore_event_widget.dart';
import 'package:event_management/feature/homePage/view/widgets/ticket_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFeedPage extends HookConsumerWidget {
  const HomeFeedPage({
    super.key,
    required this.textController,
    required this.filterList,
    required this.selectedFilter,
  });

  final TextEditingController textController;
  final ValueNotifier<List<String>> filterList;
  final ValueNotifier<String?> selectedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final eventNotifier = ref.watch(eventProvider.notifier);
    /// isfavroite is a state provider that allows the user to toggle the favorite status of an event

    void onLogoutPressed() {
      /// logout is a function that allows the user to logout of the app
      ref.read(authControllerProvider.notifier).logout();
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user.png'),
          radius: 16,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'User Profile',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: onLogoutPressed,
              icon: const Icon(Icons.logout_outlined)),
          IconButton(
            onPressed: () {},
            icon: Badge.count(
              backgroundColor: Colors.amberAccent,
              textColor: Colors.black,
              count: 1,
              child: const Icon(Icons.notifications_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// search bar
              /// search bar is a widget that allows the user to search for a specific item
              SearchBar(
                // elevation: const WidgetStatePropertyAll(0),
                controller: textController,
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16)),
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                onChanged: (value) {
                  /// search event by name or location
                  // eventNotifier.searchEvents(value); // Corrected method name
                },
                onSubmitted: (value) {},
                leading: const Icon(Icons.search),
              ),

              /// Filter List is a widget that allows the user to filter the events by category

              SizedBox(
                height: 45,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // itemCount: filterList.value.length,
                  itemCount: ref.watch(eventProvider).length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                /// if selected filter is equal to filter list value then change background color
                                backgroundColor: selectedFilter.value ==
                                        filterList.value[index]
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                              onPressed: () {
                                /// if selected filter is equal to filter list value then change background color
                                selectedFilter.value = filterList.value[index];
                              },
                              child: Text(filterList.value[index])),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// Ticket Card
              const TicketCardWidget(),
              const Text("Explore", style: TextStyle(fontSize: 20)),
              const ExploreEventWidget(),

              const Text('Home Page'),
            ],
          ),
        ),
      ),
    );
  }
}
