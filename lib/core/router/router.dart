import 'package:event_management/feature/homePage/view/pages/cart_page.dart';
import 'package:event_management/feature/homePage/view/pages/festival_details_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    // GoRoute(
    //     path: '/festival',
    //     builder: (context, state) => FestivalDetailsPage(
    //           festivalIdList:
    //               state.extra as List<Map<String, Map<String, String>>>,
    //         ),
    //     name: "festival")
    GoRoute(
        path: '/festival',
        builder: (context, state) => const FestivalDetailsPage(),
        name: "festival"),
    GoRoute(
        path: '/cart',
        builder: (context, state) => const CartPage(),
        name: "cart"),
  ],
);
