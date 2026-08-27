import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class ProviderDashboardScreen extends StatelessWidget {
  const ProviderDashboardScreen({super.key});

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
        title: const Row(
          children: [
            Icon(
              Icons.cleaning_services_rounded,
              color: AppColors.accentPink,
            ),
            SizedBox(width: 10),
            Text(
              'DEKIO PRO',
              style: TextStyle(
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
                  const Text(
                    'Good morning 👋',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.slateMuted,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Manage your cleaning business.',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                    ),
                  ),

                  const SizedBox(height: 25),

                  _buildStats(isDesktop),

                  const SizedBox(height: 30),

                  _sectionTitle(
                    'New Booking Requests',
                    'View all',
                  ),

                  const SizedBox(height: 14),

                  _buildBookingRequest(),

                  const SizedBox(height: 30),

                  _sectionTitle(
                    'Upcoming Jobs',
                    'View schedule',
                  ),

                  const SizedBox(height: 14),

                  _buildUpcomingJobs(),

                  const SizedBox(height: 30),

                  _sectionTitle(
                    'Quick Actions',
                    '',
                  ),

                  const SizedBox(height: 14),

                  _buildQuickActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStats(bool isDesktop) {
    final stats = [
      (
        'Jobs',
        '8',
        Icons.work_outline_rounded,
        AppColors.primaryBlue,
      ),
      (
        'Earnings',
        'TZS 145K',
        Icons.payments_outlined,
        AppColors.accentOrange,
      ),
      (
        'Rating',
        '4.9',
        Icons.star_outline_rounded,
        AppColors.accentPink,
      ),
    ];

    return Row(
      children: stats.map((stat) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: stat == stats.last ? 0 : 10,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: AppColors.borderLight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  stat.$3,
                  color: stat.$4,
                  size: 21,
                ),
                const SizedBox(height: 12),
                Text(
                  stat.$1,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.slateMuted,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  stat.$2,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: AppColors.inkNavy,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _sectionTitle(
    String title,
    String action,
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
        if (action.isNotEmpty)
          TextButton(
            onPressed: () {},
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

  Widget _buildBookingRequest() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.accentPink.withValues(
                    alpha: 0.10,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: AppColors.accentPink,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Request',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.inkNavy,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Home Cleaning • Today, 3:00 PM',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.slateMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'TZS 25K',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: AppColors.inkNavy,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Decline'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingJobs() {
    return Column(
      children: [
        _jobCard(
          'Office Cleaning',
          'Tomorrow • 10:00 AM',
          'TZS 40,000',
          Icons.business_rounded,
        ),
        const SizedBox(height: 10),
        _jobCard(
          'Deep Cleaning',
          'Friday • 2:00 PM',
          'TZS 55,000',
          Icons.cleaning_services_rounded,
        ),
      ],
    );
  }

  Widget _jobCard(
    String title,
    String time,
    String amount,
    IconData icon,
  ) {
    return Container(
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
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppColors.inkNavy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.slateMuted,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.inkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      (
        Icons.calendar_month_outlined,
        'Availability',
        AppColors.primaryBlue,
      ),
      (
        Icons.person_outline_rounded,
        'My Profile',
        AppColors.accentPink,
      ),
      (
        Icons.account_balance_wallet_outlined,
        'Earnings',
        AppColors.accentOrange,
      ),
    ];

    return Row(
      children: actions.map((action) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: action == actions.last ? 0 : 10,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: AppColors.borderLight,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  action.$1,
                  color: action.$3,
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  action.$2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.inkNavy,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}