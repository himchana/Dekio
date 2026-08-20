import 'package:flutter/material.dart';
import '../core/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const Color mintWhite = Color(0xFFF0FAF8);
  static const Color inkNavy = Color(0xFF0F172A);
  static const Color buttonTeal = Color(0xFF0E7C71);
  static const Color deepTeal = Color(0xFF0B6E63);

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
            const SizedBox(height: 20),

            const Text(
              'Create account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: inkNavy,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Join DEKIO and discover services around you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            _inputField(
              label: 'Full Name',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 16),

            _inputField(
              label: 'Email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            _inputField(
              label: 'Password',
              icon: Icons.lock_outline,
              obscureText: true,
            ),

            const SizedBox(height: 26),

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
                  'Register',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.login,
                  );
                },
                child: const Text(
                  'Already have an account? Login',
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

  Widget _inputField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}