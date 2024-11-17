import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final selectedFilter = useState<String?>(null);
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
                                itemCount: 10,
                                itemBuilder: (context, index) {
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
                                            const Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 40,
                                                      width: 40,
                                                      child: Placeholder()),
                                                  SizedBox(width: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Festival Name'),
                                                      Text('Festival Location'),
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
                                                      const Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text('Time'),
                                                            Text('10:00 PM'),
                                                          ],
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        child:
                                                            Column(children: [
                                                          Text('Location'),
                                                          Text(
                                                              'California, CA'),
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
