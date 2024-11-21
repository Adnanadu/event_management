import 'package:event_management/feature/favoritePage/view/pages/favorite_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_feed_page.dart';
import 'package:event_management/feature/postPage/view/pages/post_page.dart';
import 'package:event_management/feature/profile_page/view/pages/profile_page.dart';
import 'package:event_management/feature/ticketPage/view/pages/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final eventNotifier = ref.watch(eventProvider.notifier);
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

    final selectedFilter = useState<String?>(null);
    final isFavourite = useState<bool>(false);

    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth <= 450) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
            children: [
              /// home page
              HomeFeedPage(
                textController: textController,
                filterList: filterList,
                selectedFilter: selectedFilter,
                festivalId: festivalId,
                isFavourite: isFavourite,
              ),

              /// favourites page
              const FavoritePage(),

              ///
              const PostPage(),

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
                  icon: Icon(Icons.add_circle_outline_outlined), label: 'Post'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Tickets'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      } else if (screenWidth > 450 && screenWidth <= 800) {
        return const Text('Tablet');
      } else {
        // desktop more than 800
        return const Text('Desktop');
      }
    });
  }
}
