import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_widget/ticket_widget.dart';

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

    ///festival List of Name, date, time and Description
    final festivalId = useState<Map<String, Map<String, String>>>({
      'festival1': {
        "name": "Festival 1",
        "date": "2023-06-01",
        "time": "10:00 AM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      },
      'festival2': {
        "name": "Festival 2",
        "date": "2023-06-02",
        "time": "11:00 AM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      },
      'festival3': {
        "name": "Festival 3",
        "date": "2023-06-03",
        "time": "12:00 PM",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
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
                              ///filter the list based on the search text
                              filterList.value = filterList.value
                                  .where((element) =>
                                      element.toLowerCase().contains(value))
                                  .toList();
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
                          SizedBox(
                            width: double.infinity,
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: festivalId.value.length,
                                itemBuilder: (context, index) {
                                  final festival =
                                      festivalId.value.values.elementAt(index);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: TicketWidget(
                                        width: 0,
                                        height: 0,
                                        isCornerRounded: true,
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                      height: 40,
                                                      width: 40,
                                                      child: Placeholder()),
                                                  const SizedBox(width: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      /// Festival name display here
                                                      Text(festival['name'] ??
                                                          ""),
                                                      Text(festival[
                                                              'location'] ??
                                                          ""),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.red,
                                              height: 1,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(festival[
                                                                    'date'] ??
                                                                ""),
                                                            Text(festival[
                                                                    'time'] ??
                                                                ""),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            Column(children: [
                                                          Text(festival[
                                                                  'location'] ??
                                                              ""),
                                                          Text(festival[
                                                                  'location'] ??
                                                              ""),
                                                        ]),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 2),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          // height: 10,
                                                          child: const Text(
                                                              "Premium Ticket x1"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Explore", style: TextStyle(fontSize: 20)),
                              // TextButton(
                              //     onPressed: () {},
                              //     child: const Text("View All"))
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: festivalId.value.length,
                            itemBuilder: (context, index) {
                              final festival =
                                  festivalId.value.values.elementAt(index); //
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/user.jpg"),
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
                                              /// add and remove from favourite and when click on favourite icon change color
                                              isFavourite.value =
                                                  !isFavourite.value;
                                              if (isFavourite.value) {
                                                /// add to favourite
                                              } else {
                                                /// remove from favourite
                                              }
                                            },
                                            icon: Icon(isFavourite.value
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined))),
                                    Positioned(
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(festival['name'] ?? ""),
                                              Text(festival['location'] ?? ""),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  /// display date and time from festivalId
                                                  Text(festival['date'] ?? ""),
                                                  Text(festival['time'] ?? ""),
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

                          const Text('Home Page'),
                        ],
                      ),
                    ),
                  ),
                ),

                /// favourites page
                const Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Favourites Page'),
                      ],
                    ),
                  ),
                ),

                /// tickets page
                const Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Tickets Page'),
                      ],
                    ),
                  ),
                ),

                /// profile page
                const Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Profile Page'),
                      ],
                    ),
                  ),
                )
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
