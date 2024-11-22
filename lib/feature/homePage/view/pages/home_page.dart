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
      pageController.jumpToPage(
        index,
        // duration: const Duration(milliseconds: 300),
        // curve: Curves.easeInOut,
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
                // festivalId: festivalId,
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
