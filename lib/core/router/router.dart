import 'package:event_management/feature/authPage/services/auth_services.dart';
import 'package:event_management/feature/authPage/view/pages/create_new_password_page.dart';
import 'package:event_management/feature/authPage/view/pages/forgot_password_page.dart';
import 'package:event_management/feature/authPage/view/pages/otp_code_page.dart';
import 'package:event_management/feature/authPage/view/pages/profile_form_page.dart';
import 'package:event_management/feature/authPage/view/pages/sign_in_page.dart';
import 'package:event_management/feature/authPage/view/pages/sign_up.dart';
import 'package:event_management/feature/favoritePage/view/pages/favorite_page.dart';
import 'package:event_management/feature/homePage/model/event_model.dart';
import 'package:event_management/feature/homePage/view/pages/cart_page.dart';
import 'package:event_management/feature/homePage/view/pages/event_details_page.dart';
import 'package:event_management/feature/postPage/view/pages/create_event_page.dart';
import 'package:event_management/feature/postPage/view/pages/post_page.dart';
import 'package:event_management/feature/profile_page/view/pages/profile_page.dart';
import 'package:event_management/feature/dashboardPage/view/pages/dashboard_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:event_management/feature/ticketPage/view/pages/ticket_page.dart';
import 'package:event_management/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SignInPage.routePath,
  navigatorKey: EventManagementApp.navigatorkey,
  routes: [
    GoRoute(
        path: ForgotPasswordPage.routePath,
        builder: (context, state) => const ForgotPasswordPage(),
        name: "forgotpassword"),
    GoRoute(
        path: OtpCodePage.routePath,
        builder: (context, state) => const OtpCodePage(),
        name: "otpcode"),
    GoRoute(
        path: CreateNewPasswordPage.routePath,
        builder: (context, state) => const CreateNewPasswordPage(),
        name: "newpassword"),
    GoRoute(
        path: DashboardPage.routePath,
        builder: (context, state) => const DashboardPage(),
        name: "dashboard"),
    GoRoute(
        path: HomePage.routePath,
        builder: (context, state) => const HomePage(),
        name: "homepage"),
    GoRoute(
        path: ProfilePage.routePath,
        builder: (context, state) => const ProfilePage(),
        name: "profilepage"),
    GoRoute(
        path: PostPage.routePath,
        builder: (context, state) => const PostPage(),
        name: "postpage"),
    GoRoute(
        path: CartPage.routePath,
        builder: (context, state) => const CartPage(),
        name: "cartpage"),
    GoRoute(
        path: CreateEventPage.routePath,
        builder: (context, state) => const CreateEventPage(),
        name: "createeventpage"),
    GoRoute(
      path: SignInPage.routePath,
      builder: (context, state) => const SignInPage(),
      name: "signin",
      redirect: (context, state) {
        final user = AuthServices.getCurrentUserSync();
        if (user != null) {
          return HomePage.routePath;
        }
        return null;
      },
    ),

    GoRoute(
        path: SignUpPage.routePath,
        builder: (context, state) => const SignUpPage(),
        name: "signup"),
    GoRoute(
        path: TicketPage.routePath,
        builder: (context, state) => const TicketPage(),
        name: "ticketpage"),
    GoRoute(
        path: FavoritePage.routePath,
        builder: (context, state) => const FavoritePage(),
        name: "favoritepage"),
    GoRoute(
        path: ProfileFormPage.routePath,
        builder: (context, state) => const ProfileFormPage(),
        name: "profileformpage"),
    GoRoute(
        path: EventDetailsPage.routePath,
        builder: (context, state) => EventDetailsPage(
              event: state.extra as EventModel,
            ),
        name: "eventdetailspage"),

    //Pending Pages
    // GoRoute(path: PaymentPage.routePath, builder: (context, state) => const PaymentPage(), name: "paymentpage"),
    // GoRoute(path: PaymentSuccessPage.routePath, builder: (context, state) => const PaymentSuccessPage(), name: "paymentsuccesspage"),
  ],
);
