import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth >= 800;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.inkNavy,
            elevation: 0.5,
            automaticallyImplyLeading: !isLargeScreen,
            title: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: AppColors.brandGradient,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(Icons.auto_awesome,
                      color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                const Text(
                  'DEKIO',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            actions: isLargeScreen
                ? [
                    _navButton(
                        context, 'Home', Icons.home_outlined, AppRoutes.home),
                    _navButton(context, 'Services', Icons.grid_view_rounded,
                        AppRoutes.services),
                    _navButton(context, 'Login', Icons.login, AppRoutes.login),
                    _navButton(context, 'Register', Icons.person_add_outlined,
                        AppRoutes.register),
                    _navButton(context, 'Settings', Icons.settings_outlined,
                        AppRoutes.settings),
                    const SizedBox(width: 12),
                  ]
                : null,
          ),
          drawer: isLargeScreen ? null : _buildDrawer(context),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 860),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Brand Icon
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: AppColors.brandGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.handyman_rounded,
                        size: 44,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Welcome to DEKIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.inkNavy,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'High-resolution fixed scenario photos with fast disk caching.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.slateMuted,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Explore Services Button
                    ElevatedButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.services),
                      icon: const Icon(Icons.search, size: 20),
                      label: const Text(
                        'Browse All Services',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Brand Feature Highlights Banner
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.borderLight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.accentOrange.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.verified_rounded,
                                color: AppColors.accentOrange, size: 24),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI & Signal Processing Hub Certified',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.inkNavy,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Fixed Unsplash resolution (w=400, q=80) for instant loading.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.slateMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              size: 15, color: AppColors.slateMuted),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: AppColors.brandGradient,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 34),
                  SizedBox(height: 8),
                  Text(
                    'DEKIO • AI HUB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _drawerItem(context, 'Home', Icons.home_outlined, AppRoutes.home),
          _drawerItem(
              context, 'Services', Icons.grid_view_rounded, AppRoutes.services),
          _drawerItem(context, 'Login', Icons.login, AppRoutes.login),
          _drawerItem(context, 'Register', Icons.person_add_outlined,
              AppRoutes.register),
          _drawerItem(
              context, 'Settings', Icons.settings_outlined, AppRoutes.settings),
        ],
      ),
    );
  }

  static Widget _navButton(
      BuildContext context, String title, IconData icon, String route) {
    return TextButton.icon(
      onPressed: () {
        if (route != AppRoutes.home) {
          Navigator.pushNamed(context, route);
        }
      },
      icon: Icon(icon, size: 18, color: AppColors.primaryBlue),
      label: Text(title,
          style: const TextStyle(
              color: AppColors.inkNavy, fontWeight: FontWeight.w600)),
    );
  }

  static Widget _drawerItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryBlue),
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.inkNavy)),
      onTap: () {
        Navigator.pop(context);
        if (route != AppRoutes.home) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
