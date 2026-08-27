import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/services_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/role_selection_screen.dart';
import '../screens/customer_dashboard_screen.dart';
import '../screens/provider_dashboard_screen.dart';

import '../screens/service_details_screen.dart' as service_details;
import '../screens/professional_selection_screen.dart'
    as professional_selection;

import '../screens/booking_screen.dart';
import '../screens/booking_confirmation_screen.dart';

class AppRoutes {
  // ==========================================================
  // MAIN
  // ==========================================================

  static const String splash = '/';

  static const String home = '/home';

  static const String services = '/services';

  // ==========================================================
  // AUTHENTICATION
  // ==========================================================

  static const String login = '/login';

  static const String register = '/register';

  // ==========================================================
  // SETTINGS
  // ==========================================================

  static const String settings = '/settings';

  // ==========================================================
  // ROLE SELECTION
  // ==========================================================

  static const String roleSelection = '/role-selection';

  // ==========================================================
  // DASHBOARDS
  // ==========================================================

  static const String customerDashboard =
      '/customer-dashboard';

  static const String providerDashboard =
      '/provider-dashboard';

  // ==========================================================
  // SERVICE FLOW
  // ==========================================================

  static const String serviceDetails =
      '/service-details';

  static const String professionalSelection =
      '/professional-selection';

  static const String booking =
      '/booking';

  static const String bookingConfirmation =
      '/booking-confirmation';

  // ==========================================================
  // ROUTES MAP
  // ==========================================================

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // ======================================================
      // SPLASH
      // ======================================================

      splash: (context) {
        return const SplashScreen();
      },

      // ======================================================
      // HOME
      // ======================================================

      home: (context) {
        return const HomeScreen();
      },

      // ======================================================
      // SERVICES
      // ======================================================

      services: (context) {
        return ServicesScreen();
      },

      // ======================================================
      // LOGIN
      // ======================================================

      login: (context) {
        return const LoginScreen();
      },

      // ======================================================
      // REGISTER
      // ======================================================

      register: (context) {
        return const RegisterScreen();
      },

      // ======================================================
      // SETTINGS
      // ======================================================

      settings: (context) {
        return const SettingsScreen();
      },

      // ======================================================
      // ROLE SELECTION
      // ======================================================

      roleSelection: (context) {
        return const RoleSelectionScreen();
      },

      // ======================================================
      // CUSTOMER DASHBOARD
      // ======================================================

      customerDashboard: (context) {
        return const CustomerDashboardScreen();
      },

      // ======================================================
      // PROVIDER DASHBOARD
      // ======================================================

      providerDashboard: (context) {
        return const ProviderDashboardScreen();
      },

      // ======================================================
      // SERVICE DETAILS
      // ======================================================

      serviceDetails: (context) {
        final arguments =
            ModalRoute.of(context)?.settings.arguments;

        if (arguments is! Map<String, dynamic>) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Service details not found.',
              ),
            ),
          );
        }

        return service_details.ServiceDetailsScreen(
          serviceName:
              arguments['serviceName'] as String? ??
                  'Cleaning Service',

          description:
              arguments['description'] as String? ??
                  'Professional cleaning service.',

          price:
              arguments['price'] as String? ??
                  'Price unavailable',

          duration:
              arguments['duration'] as String? ??
                  'Flexible',

          icon:
              arguments['icon'] as IconData? ??
                  Icons.cleaning_services_rounded,

          serviceColor:
              arguments['serviceColor'] as Color? ??
                  const Color(0xFF0B6E63),
        );
      },

      // ======================================================
      // PROFESSIONAL SELECTION
      // ======================================================

      professionalSelection: (context) {
        final arguments =
            ModalRoute.of(context)?.settings.arguments;

        if (arguments is! Map<String, dynamic>) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Professional selection information not found.',
              ),
            ),
          );
        }

        return professional_selection
            .ProfessionalSelectionScreen(
          serviceName:
              arguments['serviceName'] as String? ??
                  'Cleaning Service',

          price:
              arguments['price'] as String? ??
                  'Price unavailable',
        );
      },

      // ======================================================
      // BOOKING
      // ======================================================

      booking: (context) {
        final arguments =
            ModalRoute.of(context)?.settings.arguments;

        if (arguments is! Map<String, dynamic>) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Booking information not found.',
              ),
            ),
          );
        }

        return BookingScreen(
          serviceName:
              arguments['serviceName'] as String? ??
                  'Cleaning Service',

          price:
              arguments['price'] as String? ??
                  'Price unavailable',
        );
      },

      // ======================================================
      // BOOKING CONFIRMATION
      // ======================================================

      bookingConfirmation: (context) {
        final arguments =
            ModalRoute.of(context)?.settings.arguments;

        if (arguments is! Map<String, dynamic>) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Booking confirmation information not found.',
              ),
            ),
          );
        }

        return BookingConfirmationScreen(
          serviceName:
              arguments['serviceName'] as String? ??
                  'Cleaning Service',

          price:
              arguments['price'] as String? ??
                  'Price unavailable',

          date:
              arguments['date'] as String? ??
                  'Not selected',

          time:
              arguments['time'] as String? ??
                  'Not selected',

          address:
              arguments['address'] as String? ??
                  'Address not provided',
        );
      },
    };
  }

  // ==========================================================
  // ROUTES GETTER
  // ==========================================================

  static Map<String, WidgetBuilder> get routes =>
      getRoutes();
}