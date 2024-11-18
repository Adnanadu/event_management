import 'package:event_management/feature/homePage/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget? child;

    return ResponsiveBreakpoints.builder(
      landscapePlatforms: [
        ResponsiveTargetPlatform.android,
        ResponsiveTargetPlatform.iOS,
      ],
      // Landscape breakpoints
      breakpointsLandscape: [
        const Breakpoint(start: 0, end: 450, name: 'MOBILE'),
        const Breakpoint(start: 451, end: 800, name: 'TABLET'),
        const Breakpoint(start: 801, end: double.infinity, name: 'DESKTOP'),
      ],
      // Portrait breakpoints
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: 'MOBILE'),
        const Breakpoint(start: 451, end: 800, name: 'TABLET'),
        const Breakpoint(start: 801, end: double.infinity, name: 'DESKTOP'),
      ],
      child: const HomePage(),
    );
  }
}
