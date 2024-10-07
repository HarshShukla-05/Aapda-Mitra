import 'package:aapda_mitra/app_theme.dart';
import 'package:aapda_mitra/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aapda Mitra',
      theme: AppTheme.lightTheme(context),
      routerConfig: AppRoutes().router,
    );
  }
}
