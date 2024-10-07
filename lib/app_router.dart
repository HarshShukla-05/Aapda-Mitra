import 'package:aapda_mitra/core/constants/app_routes.dart';
import 'package:aapda_mitra/screens/agency_homescreen.dart';
import 'package:aapda_mitra/screens/landing_screen.dart';
import 'package:aapda_mitra/screens/login_screen.dart';
import 'package:aapda_mitra/screens/signup_screen.dart';
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
    GoRoute(
      path: Routes.singUpPageRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(child: SignupScreen());
      },
    ),
    GoRoute(
      path: Routes.loginInPageRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: Routes.agencyHomePageRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(child: AgencyHomeScreen());
      },
    ),
  ]);
}
