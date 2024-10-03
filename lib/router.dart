import 'package:aapda_mitra/core/constants/routes_name.dart';
import 'package:aapda_mitra/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: Routes.landingPageRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(child: LandingScreen());
      },
    ),
  ]);
}
