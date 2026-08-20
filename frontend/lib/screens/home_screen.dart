import 'package:flutter/material.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FAF8),

      appBar: AppBar(
        title: const Text(
          'DEKIO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0B6E63),
        foregroundColor: Colors.white,
      ),

      // Navigation drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B6E63),
                    Color(0xFF17A398),
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

            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.login,
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Register'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.register,
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.miscellaneous_services,
              ),
              title: const Text('Services'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.services,
                );
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: Text(
          'Welcome to DEKIO',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }
}