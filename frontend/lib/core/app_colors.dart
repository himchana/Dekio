import 'package:flutter/material.dart';

class AppColors {
  // Brand Tri-Color Spectrum
  static const Color primaryBlue = Color(0xFF135AAD);  // #135AAD
  static const Color accentOrange = Color(0xFFF48936); // #F48936
  static const Color accentPink = Color(0xFFE2397C);   // #E2397C

  // Soft Surface Tints
  static const Color blueLight = Color(0xFFE8F1FA);
  static const Color orangeLight = Color(0xFFFEF3EB);
  static const Color pinkLight = Color(0xFFFCEBF2);

  // Background & Neutrals
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color inkNavy = Color(0xFF0F172A);
  static const Color slateMuted = Color(0xFF64748B);
  static const Color borderLight = Color(0xFFE2E8F0);

  // Signature Multi-Stop Brand Gradient
  static const LinearGradient brandGradient = LinearGradient(
    colors: [primaryBlue, accentOrange, accentPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}