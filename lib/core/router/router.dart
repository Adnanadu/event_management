import 'package:event_management/feature/authPage/view/pages/create_new_password_page.dart';
import 'package:event_management/feature/authPage/view/pages/forgot_password_page.dart';
import 'package:event_management/feature/authPage/view/pages/otp_code_page.dart';
import 'package:event_management/feature/authPage/view/pages/profile_form_page.dart';
import 'package:event_management/feature/authPage/view/pages/sign_in_page.dart';
import 'package:event_management/feature/authPage/view/pages/sign_up.dart';
import 'package:event_management/feature/favoritePage/view/pages/favorite_page.dart';
import 'package:event_management/feature/homePage/profile_page/view/pages/profile_page.dart';
import 'package:event_management/feature/homePage/view/pages/cart_page.dart';
import 'package:event_management/feature/homePage/view/pages/festival_details_page.dart';
import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:event_management/feature/ticketPage/view/pages/ticket_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/signin',
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
        path: '/festival',
        builder: (context, state) => const FestivalDetailsPage(),
        name: "festival"),
    GoRoute(
        path: '/cart',
        builder: (context, state) => const DashboardPage(),
        name: "cart"),
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
    //     path: "/intro",
    //     builder: (context, state) => const IntroPage(),
    //     name: "intro"),
  ],
);
