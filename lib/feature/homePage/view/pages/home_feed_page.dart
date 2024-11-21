import 'package:event_management/feature/homePage/view/pages/explore_event_widget.dart';
import 'package:event_management/feature/homePage/view/widgets/ticket_card_widget.dart';
import 'package:flutter/material.dart';

class HomeFeedPage extends StatelessWidget {
  const HomeFeedPage({
    super.key,
    required this.textController,
    required this.filterList,
    required this.selectedFilter,
    required this.festivalId,
    required this.isFavourite,
  });

  final TextEditingController textController;
  final ValueNotifier<List<String>> filterList;
  final ValueNotifier<String?> selectedFilter;
  final ValueNotifier<Map<String, Map<String, String>>> festivalId;
  final ValueNotifier<bool> isFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
            onPressed: () {},
            icon: Badge.count(
              backgroundColor: Colors.blue[400],
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
                  /// Implement a search bar to find events by name or location.
                  // festivalId.value = festivalId.value
                  //     .where((element) =>
                  //         element['name']
                  //             .toLowerCase()
                  //             .contains(value))
                  //     .toList();
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
                  itemCount: filterList.value.length,
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
              TicketCardWidget(festivalId: festivalId),
              const Text("Explore", style: TextStyle(fontSize: 20)),
              ExploreEventWidget(
                  festivalId: festivalId, isFavourite: isFavourite),

              const Text('Home Page'),
            ],
          ),
        ),
      ),
    );
  }
}
