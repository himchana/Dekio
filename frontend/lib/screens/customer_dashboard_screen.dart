import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class CustomerDashboardScreen extends StatelessWidget {
  const CustomerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
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
                fontSize: 21,
                fontWeight: FontWeight.w900,
                color: AppColors.inkNavy,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.settings,
              );
            },
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 35),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(),

                  const SizedBox(height: 22),

                  _buildSearchBar(),

                  const SizedBox(height: 25),

                  _buildQuickActions(isDesktop),

                  const SizedBox(height: 30),

                  _buildSectionTitle(
                    'Popular Services',
                    'View all',
                    () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.services,
                      );
                    },
                  ),

                  const SizedBox(height: 14),

                  _buildServices(),

                  const SizedBox(height: 30),

                  _buildSectionTitle(
                    'Upcoming Booking',
                    'View bookings',
                    () {},
                  ),

                  const SizedBox(height: 14),

                  _buildUpcomingBooking(),

                  const SizedBox(height: 30),

                  _buildSectionTitle(
                    'Recommended Professionals',
                    'View all',
                    () {},
                  ),

                  const SizedBox(height: 14),

                  _buildProfessionals(isDesktop),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good morning 👋',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.slateMuted,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'What would you like\ncleaned today?',
                style: TextStyle(
                  fontSize: 29,
                  height: 1.12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.inkNavy,
                  letterSpacing: -0.7,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withValues(
              alpha: 0.10,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_outline_rounded,
            color: AppColors.primaryBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: const Row(
        children: [
          SizedBox(width: 16),
          Icon(
            Icons.search_rounded,
            color: AppColors.slateMuted,
          ),
          SizedBox(width: 10),
          Text(
            'Search cleaning services or professionals...',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.slateMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(bool isDesktop) {
    final actions = [
      (
        Icons.cleaning_services_rounded,
        'Book Cleaning',
        AppColors.primaryBlue,
      ),
      (
        Icons.calendar_month_rounded,
        'My Bookings',
        AppColors.accentPink,
      ),
      (
        Icons.location_on_outlined,
        'Find Nearby',
        AppColors.accentOrange,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: actions.map((action) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: action == actions.last ? 0 : 10,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(17),
                  onTap: () {
                    if (action.$2 == 'Book Cleaning') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.services,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: AppColors.borderLight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: action.$3.withValues(
                              alpha: 0.10,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            action.$1,
                            color: action.$3,
                            size: 21,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          action.$2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.inkNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildSectionTitle(
    String title,
    String action,
    VoidCallback onTap,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.inkNavy,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServices() {
    final services = [
      (
        'Home Cleaning',
        'From TZS 15,000',
        Icons.home_rounded,
        AppColors.accentPink,
      ),
      (
        'Office Cleaning',
        'From TZS 25,000',
        Icons.business_rounded,
        AppColors.primaryBlue,
      ),
      (
        'Deep Cleaning',
        'From TZS 30,000',
        Icons.cleaning_services_rounded,
        AppColors.accentOrange,
      ),
    ];

    return SizedBox(
      height: 145,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        separatorBuilder: (_, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          final service = services[index];

          return InkWell(
            borderRadius: BorderRadius.circular(19),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.services,
              );
            },
            child: Container(
              width: 190,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: AppColors.borderLight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: service.$4.withValues(
                        alpha: 0.10,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      service.$3,
                      color: service.$4,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    service.$1,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.inkNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.$2,
                    style: const TextStyle(
                      fontSize: 10.5,
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

  Widget _buildUpcomingBooking() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.15,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No upcoming bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Book a cleaning service to see it here.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionals(bool isDesktop) {
    final professionals = [
      (
        'Professional Cleaner',
        'Home & Deep Cleaning',
        '4.9',
        AppColors.primaryBlue,
      ),
      (
        'Cleaning Expert',
        'Office Cleaning',
        '4.8',
        AppColors.accentPink,
      ),
      (
        'Home Care Pro',
        'Home Cleaning',
        '4.7',
        AppColors.accentOrange,
      ),
    ];

    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: professionals.length,
        separatorBuilder: (_, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) {
          final professional = professionals[index];

          return Container(
            width: isDesktop ? 260 : 230,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.borderLight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: professional.$4.withValues(
                      alpha: 0.10,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    color: professional.$4,
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        professional.$1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.inkNavy,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        professional.$2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10.5,
                          color: AppColors.slateMuted,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: AppColors.accentOrange,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            professional.$3,
                            style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}