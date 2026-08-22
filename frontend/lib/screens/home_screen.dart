import 'package:flutter/material.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color deepTeal = Color(0xFF0B6E63);
  static const Color brightTeal = Color(0xFF17A398);
  static const Color mintWhite = Color(0xFFF0FAF8);
  static const Color inkNavy = Color(0xFF0F172A);
  static const Color buttonTeal = Color(0xFF0E7C71);
  static const Color goldenAccent = Color(0xFFF5B942);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLargeScreen = constraints.maxWidth >= 800;

        return Scaffold(
          backgroundColor: mintWhite,

          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: inkNavy,
            elevation: 1,

            // Hamburger only appears on small screens.
            automaticallyImplyLeading: !isLargeScreen,

            title: const Text(
              'DEKIO',
              style: TextStyle(
                color: deepTeal,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            actions: isLargeScreen
                ? [
                    _navButton(
                      context,
                      'Home',
                      Icons.home_outlined,
                      AppRoutes.home,
                    ),
                    _navButton(
                      context,
                      'Services',
                      Icons.miscellaneous_services_outlined,
                      AppRoutes.services,
                    ),
                    _navButton(
                      context,
                      'Login',
                      Icons.login,
                      AppRoutes.login,
                    ),
                    _navButton(
                      context,
                      'Register',
                      Icons.person_add_outlined,
                      AppRoutes.register,
                    ),
                    _navButton(
                      context,
                      'Settings',
                      Icons.settings_outlined,
                      AppRoutes.settings,
                    ),
                    const SizedBox(width: 12),
                  ]
                : null,
          ),

          drawer: isLargeScreen
              ? null
              : Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              deepTeal,
                              brightTeal,
                            ],
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'DEKIO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                        Icons.miscellaneous_services_outlined,
                        AppRoutes.services,
                      ),

                      _drawerItem(
                        context,
                        'Login',
                        Icons.login,
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

                      const Divider(),

                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.redAccent,
                        ),
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),

          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.handyman_outlined,
                      size: 70,
                      color: deepTeal,
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Welcome to DEKIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: inkNavy,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Discover trusted services around you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 32),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.services,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonTeal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Browse Services',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: goldenAccent.withValues(alpha: 0.4),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: goldenAccent,
                            size: 30,
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              'Find the right service provider for your needs.',
                              style: TextStyle(
                                color: inkNavy,
                                fontSize: 15,
                              ),
                            ),
                          ),
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

  static Widget _navButton(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return TextButton.icon(
      onPressed: () {
        if (route == AppRoutes.home) {
          return;
        }

        Navigator.pushNamed(context, route);
      },
      icon: Icon(
        icon,
        size: 19,
        color: deepTeal,
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: inkNavy,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _drawerItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: deepTeal,
      ),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);

        if (route != AppRoutes.home) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}