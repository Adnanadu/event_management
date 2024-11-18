import 'package:event_management/feature/homePage/view/pages/festival_details_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/festival',
    builder: (context, state) => FestivalDetailsPage(
      festivalId: state.extra.toString(),
      
    ),
    name: "festival"
    
    )
  ],
);
