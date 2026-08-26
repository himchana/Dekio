import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/services_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String services = '/services';
  static const String login = '/login';
  static const String register = '/register';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      home: (context) => const HomeScreen(),
      services: (context) => const ServicesScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      settings: (context) => const SettingsScreen(),
    };
  }

  static Map<String, WidgetBuilder> get routes => getRoutes();
}
