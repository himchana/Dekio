import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // Logo
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradient,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(
                            alpha: 0.20,
                          ),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'DEKIO',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Professional cleaning services',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.slateMuted,
                    ),
                  ),

                  const SizedBox(height: 45),

                  const Text(
                    'Create your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                      letterSpacing: -0.8,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Choose how you want to use DEKIO.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.slateMuted,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Role cards
                  isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildRoleCard(
                                context: context,
                                icon: Icons.person_rounded,
                                title: 'Customer',
                                description:
                                    'Book trusted cleaning professionals for your home or office.',
                                accentColor: AppColors.primaryBlue,
                                route: AppRoutes.register,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: _buildRoleCard(
                                context: context,
                                icon: Icons.cleaning_services_rounded,
                                title: 'Professional',
                                description:
                                    'Offer cleaning services and grow your professional business.',
                                accentColor: AppColors.accentPink,
                                route: AppRoutes.register,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _buildRoleCard(
                              context: context,
                              icon: Icons.person_rounded,
                              title: 'Customer',
                              description:
                                  'Book trusted cleaning professionals for your home or office.',
                              accentColor: AppColors.primaryBlue,
                              route: AppRoutes.register,
                            ),
                            const SizedBox(height: 16),
                            _buildRoleCard(
                              context: context,
                              icon: Icons.cleaning_services_rounded,
                              title: 'Professional',
                              description:
                                  'Offer cleaning services and grow your professional business.',
                              accentColor: AppColors.accentPink,
                              route: AppRoutes.register,
                            ),
                          ],
                        ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.slateMuted,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.login,
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'DEKIO • AI HUB Edition',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.slateMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color accentColor,
    required String route,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.pushNamed(
            context,
            route,
            arguments: title == 'Customer'
                ? 'customer'
                : 'professional',
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.borderLight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 29,
                ),
              ),

              const SizedBox(width: 17),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.inkNavy,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12.5,
                        height: 1.45,
                        color: AppColors.slateMuted,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              Icon(
                Icons.arrow_forward_rounded,
                color: accentColor,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}