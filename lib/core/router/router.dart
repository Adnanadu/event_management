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
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/homepage',
  routes: [
    GoRoute(
        path: "/profileform",
        builder: (context, state) => const ProfileFormPage(),
        name: "profileform"),
    GoRoute(
        path: '/homepage',
        builder: (context, state) => const HomePage(),
        name: "homepage"),
    GoRoute(
        path: '/eventdetails',
        builder: (context, state) => EventDetailsPage(
              ///pass event
              event: state.extra as EventModel,
            ),
        name: "eventdetails"),
    GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
        name: "dashboard"),
    GoRoute(
        path: "/profile",
        builder: (context, state) => const ProfilePage(),
        name: "profile"),
    GoRoute(
        path: "/ticket",
        builder: (context, state) => const TicketPage(),
        name: "ticket"),
    GoRoute(
        path: "/favorite",
        builder: (context, state) => const FavoritePage(),
        name: "favorite"),
    GoRoute(
        path: "/signin",
        builder: (context, state) => const SignInPage(),
        name: "signin"),
    GoRoute(
        path: "/signup",
        builder: (context, state) => const SignUpPage(),
        name: "signup"),
    GoRoute(
        path: "/forgotpassword",
        builder: (context, state) => const ForgotPasswordPage(),
        name: "forgotpassword"),
    GoRoute(
        path: "/otpcode",
        builder: (context, state) => const OtpCodePage(),
        name: "otpcode"),
    GoRoute(
        path: "/newpassword",
        builder: (context, state) => const CreateNewPasswordPage(),
        name: "newpassword"),
    // GoRoute(
    //     path: "/dashboard",
    //     builder: (context, state) => const DashboardPage(),
    //     name: "dashboard"),
    GoRoute(
        path: "/eventpage",
        builder: (context, state) => const CreateEventPage(),
        name: "eventpage"),
    GoRoute(
        path: "/postpage",
        builder: (context, state) => const PostPage(),
        name: "postpage"),
    GoRoute(
        path: "/cartpage",
        builder: (context, state) => const CartPage(),
        name: "cartpage"),

    //Pending Pages
    // GoRoute(
    //     path: "/payment",
    //     builder: (context, state) => const PaymentPage(),
    //     name: "payment"),
    // GoRoute(
    //     path: "/payment-success",
    //     builder: (context, state) => const PaymentSuccessPage(),
    //     name: "payment-success"),

    // GoRoute(
    //     path: "/intro",
    //     builder: (context, state) => const IntroPage(),
    //     name: "intro"),
  ],
);
