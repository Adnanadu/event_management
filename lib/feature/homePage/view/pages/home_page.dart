import 'package:event_management/feature/favoritePage/view/pages/favorite_page.dart';
import 'package:event_management/feature/homePage/profile_page/view/pages/profile_page.dart';
import 'package:event_management/feature/homePage/view/pages/explore_event_widget.dart';
import 'package:event_management/feature/homePage/view/widgets/ticket_card_widget.dart';
import 'package:event_management/feature/ticketPage/view/pages/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a controller for the PageView
    final pageController = usePageController();
    final textController = useTextEditingController();

    // Define a state to track the selected index for BottomNavigationBar
    final ValueNotifier<int> currentIndex = useState(0);
    // Update the PageView when a BottomNavigationBar item is tapped
    void onBottomNavTapped(int index) {
      currentIndex.value = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    // Update the BottomNavigationBar when the PageView is swiped
    void onPageChanged(int index) {
      currentIndex.value = index;
    }

    final screenWidth = MediaQuery.sizeOf(context).width;
    // final screenHeight = MediaQuery.sizeOf(context).height;
    final filterList = useState<List<String>>([
      'music',
      'sports',
      'technology',
    ]);

    ///Map of events and detailes
    final festivalId = useState<Map<String, Map<String, String>>>({
      'festival1': {
        "id": "123",
        "image": "assets/images/user.jpg",
        "category": "music",
        "name": "Festival 1",
        "date": "2023-06-01",
        "time": "10:00 AM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "price": "100",
        "location": "Location 1",
        "attendees": "100",
        "ticketType": "Premium",
      },
      'festival2': {
        "id": "124",
        "image": "assets/images/user.jpg",
        "category": "music",
        "name": "Festival 2",
        "date": "2023-06-02",
        "time": "11:00 AM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "price": "100",
        "ticketType": "Premium",
        "location": "Location 2",
        "attendees": "100",
      },
      'festival3': {
        "id": "125",
        "name": "Festival 3",
        "image": "assets/images/user.jpg",
        "date": "2023-06-03",
        "time": "12:00 PM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        "price": "100",
        "ticketType": "Premium",
        "location": "Location 3",
        "attendees": "100",
        "category": "sports",
      },
    });
    final List festivalIdList = ([
      festivalId.value,
    ]);

    final selectedFilter = useState<String?>(null);
    final isFavourite = useState<bool>(false);

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // responsive visible if breakpoint is mobile , tablet , desktop
        if (screenWidth <= 450) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                /// home page
                Scaffold(
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
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.white),
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
                          SizedBox(
                            height: 45,
                            child: ListView.builder(
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
                                            backgroundColor:
                                                selectedFilter.value ==
                                                        filterList.value[index]
                                                    ? Colors.blue
                                                    : Colors.white,
                                          ),
                                          onPressed: () {
                                            /// if selected filter is equal to filter list value then change background color
                                            selectedFilter.value =
                                                filterList.value[index];
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
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Explore", style: TextStyle(fontSize: 20)),
                              // TextButton(
                              //     onPressed: () {},
                              //     child: const Text("View All"))
                            ],
                          ),
                          ExploreEventWidget(
                              festivalId: festivalId, isFavourite: isFavourite),

                          const Text('Home Page'),
                        ],
                      ),
                    ),
                  ),
                ),

                /// favourites page
                const FavoritePage(),

                /// tickets page
                const TicketPage(),

                /// profile page
                const ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex.value,
              onTap: onBottomNavTapped,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favourites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: 'Tickets'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          );
        } else if (screenWidth > 450 && screenWidth <= 800) {
          return const Text('Tablet');
        } else {
          // desktop more than 800
          return const Scaffold();
        }
      }),
    );
  }
}
