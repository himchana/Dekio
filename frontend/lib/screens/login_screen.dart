import 'package:flutter/material.dart';
import '../core/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color deepTeal = Color(0xFF0B6E63);
  static const Color brightTeal = Color(0xFF17A398);
  static const Color mintWhite = Color(0xFFF0FAF8);
  static const Color inkNavy = Color(0xFF0F172A);
  static const Color buttonTeal = Color(0xFF0E7C71);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mintWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: inkNavy,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: inkNavy,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Login to continue to DEKIO',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 35),

            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.home,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonTeal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.register,
                  );
                },
                child: const Text(
                  'Don\'t have an account? Register',
                  style: TextStyle(
                    color: deepTeal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}