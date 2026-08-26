import 'package:flutter/material.dart';

import 'core/routes.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/services_screen.dart';
import 'screens/settings_screen.dart';
void main() {
  runApp(const DekioApp());
}

class DekioApp extends StatelessWidget {
  const DekioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEKIO',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
       AppRoutes.services: (context) => ServicesScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}