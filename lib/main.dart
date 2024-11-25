import 'package:event_management/core/router/router.dart';
import 'package:event_management/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: EventManagementApp()));
}

class EventManagementApp extends StatelessWidget {
  const EventManagementApp({super.key});
  static final navigatorkey = GlobalKey<NavigatorState>();
  // static final scaffoldGeometryKey = GlobalKey<ScaffoldMessengerState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
