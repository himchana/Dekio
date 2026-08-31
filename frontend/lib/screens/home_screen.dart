import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: AppColors.brandGradient,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: Colors.white,
                size: 21,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'DEKIO',
              style: TextStyle(
                color: AppColors.inkNavy,
                fontSize: 21,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.settings,
              );
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.inkNavy,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Good morning 👋',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.slateMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'What would you like\ncleaned today?',
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.12,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 28),
                  _buildBookingBanner(context),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Services',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: AppColors.inkNavy,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.services,
                          );
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildPopularServices(context),
                  const SizedBox(height: 30),
                  const Text(
                    'Why choose DEKIO?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.inkNavy,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildBenefits(),
                  const SizedBox(height: 30),
                  _buildQuickBooking(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // SEARCH BAR
  // ----------------------------------------------------------

  static Widget _buildSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        children: [
          SizedBox(width: 16),
          Icon(
            Icons.search_rounded,
            color: AppColors.slateMuted,
            size: 23,
          ),
          SizedBox(width: 11),
          Text(
            'Search cleaning services...',
            style: TextStyle(
              color: AppColors.slateMuted,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // BOOKING BANNER
  // ----------------------------------------------------------

  static Widget _buildBookingBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.20),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12,
            top: -20,
            child: Icon(
              Icons.cleaning_services_rounded,
              size: 125,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accentOrange.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'DEKIO CLEAN',
                  style: TextStyle(
                    color: AppColors.inkNavy,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'A cleaner space starts here.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Book trusted cleaning services for your home or office.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.services,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.accentPink,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text(
                  'Book a Service',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // POPULAR SERVICES
  // ----------------------------------------------------------

  static Widget _buildPopularServices(BuildContext context) {
    final services = [
      {
        'title': 'Home Cleaning',
        'subtitle': 'Fresh & spotless home',
        'icon': Icons.home_rounded,
        'color': AppColors.accentPink,
      },
      {
        'title': 'Office Cleaning',
        'subtitle': 'Clean workspace',
        'icon': Icons.business_rounded,
        'color': AppColors.primaryBlue,
      },
      {
        'title': 'Deep Cleaning',
        'subtitle': 'Detailed cleaning',
        'icon': Icons.cleaning_services_rounded,
        'color': AppColors.accentOrange,
      },
    ];

    return SizedBox(
      height: 158,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: services.length,
        separatorBuilder: (_, _) {
          return const SizedBox(width: 13);
        },
        itemBuilder: (context, index) {
          final service = services[index];
          final serviceColor = service['color'] as Color;

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.services,
              );
            },
            child: Container(
              width: 190,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
                border: Border.all(
                  color: AppColors.borderLight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: serviceColor.withValues(alpha: 0.11),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      service['icon'] as IconData,
                      color: serviceColor,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    service['title'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.inkNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service['subtitle'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.slateMuted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ----------------------------------------------------------
  // BENEFITS
  // ----------------------------------------------------------

  static Widget _buildBenefits() {
    final benefits = [
      (
        Icons.verified_user_rounded,
        'Trusted professionals',
        'Quality-focused cleaning service.',
      ),
      (
        Icons.schedule_rounded,
        'Flexible booking',
        'Choose a time that works for you.',
      ),
      (
        Icons.price_check_rounded,
        'Clear pricing',
        'Know the service price upfront.',
      ),
    ];

    return Column(
      children: benefits.map((benefit) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: AppColors.borderLight,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  color: AppColors.accentPink.withValues(alpha: 0.09),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  benefit.$1,
                  color: AppColors.accentPink,
                  size: 22,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      benefit.$2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.inkNavy,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      benefit.$3,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.slateMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ----------------------------------------------------------
  // QUICK BOOKING
  // ----------------------------------------------------------

  static Widget _buildQuickBooking(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.inkNavy,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.accentOrange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              color: AppColors.accentOrange,
            ),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need cleaning today?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Find a service and book in a few taps.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.services,
              );
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // DRAWER
  // ----------------------------------------------------------

  static Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                25,
              ),
              decoration: const BoxDecoration(
                gradient: AppColors.brandGradient,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DEKIO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Professional cleaning services',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            _drawerItem(
              context,
              'Home',
              Icons.home_outlined,
              AppRoutes.home,
            ),
            _drawerItem(
              context,
              'Services',
              Icons.cleaning_services_outlined,
              AppRoutes.services,
            ),
            _drawerItem(
              context,
              'Login',
              Icons.login_rounded,
              AppRoutes.login,
            ),
            _drawerItem(
              context,
              'Register',
              Icons.person_add_outlined,
              AppRoutes.register,
            ),
            _drawerItem(
              context,
              'Settings',
              Icons.settings_outlined,
              AppRoutes.settings,
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // DRAWER ITEM
  // ----------------------------------------------------------

  static Widget _drawerItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primaryBlue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.inkNavy,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        if (route != AppRoutes.home) {
          Navigator.pushNamed(
            context,
            route,
          );
        }
      },
    );
  }
}