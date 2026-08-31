import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class ProfessionalSelectionScreen extends StatelessWidget {
  const ProfessionalSelectionScreen({
    super.key,
    required this.serviceName,
    required this.price,
  });

  final String serviceName;
  final String price;

  @override
  Widget build(BuildContext context) {
    final professionals = [
      (
        name: 'Amina Cleaning Services',
        category: 'Home & Deep Cleaning',
        rating: '4.9',
        reviews: '126 reviews',
        distance: '2.4 km away',
        jobs: '180+ jobs',
        color: AppColors.primaryBlue,
      ),
      (
        name: 'John Clean Pro',
        category: 'Office & Home Cleaning',
        rating: '4.8',
        reviews: '98 reviews',
        distance: '3.1 km away',
        jobs: '140+ jobs',
        color: AppColors.accentPink,
      ),
      (
        name: 'Grace Home Care',
        category: 'Home Cleaning',
        rating: '4.7',
        reviews: '84 reviews',
        distance: '4.2 km away',
        jobs: '110+ jobs',
        color: AppColors.accentOrange,
      ),
      (
        name: 'Bright Clean Team',
        category: 'Deep & Office Cleaning',
        rating: '4.9',
        reviews: '156 reviews',
        distance: '5.0 km away',
        jobs: '210+ jobs',
        color: Colors.green,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        title: const Text(
          'Choose Professional',
          style: TextStyle(
            color: AppColors.inkNavy,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 850,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildSelectedService(),
                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Professionals',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: AppColors.inkNavy,
                        ),
                      ),
                      Text(
                        '${professionals.length} available',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.slateMuted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 13),

                  ...professionals.map(
                    (professional) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: 12),
                      child: _professionalCard(
                        context,
                        name: professional.name,
                        category: professional.category,
                        rating: professional.rating,
                        reviews: professional.reviews,
                        distance: professional.distance,
                        jobs: professional.jobs,
                        color: professional.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find the right professional',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            color: AppColors.inkNavy,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Choose a trusted professional for your cleaning service.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.slateMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedService() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.cleaning_services_rounded,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Service',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  serviceName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _professionalCard(
    BuildContext context, {
    required String name,
    required String category,
    required String rating,
    required String reviews,
    required String distance,
    required String jobs,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: color,
                  size: 30,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w900,
                              color: AppColors.inkNavy,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: AppColors.primaryBlue,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.slateMuted,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        _smallInfo(
                          Icons.star_rounded,
                          rating,
                          AppColors.accentOrange,
                        ),
                        _smallInfo(
                          Icons.rate_review_outlined,
                          reviews,
                          AppColors.slateMuted,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          const Divider(height: 1),

          const SizedBox(height: 13),

          Wrap(
            spacing: 18,
            runSpacing: 8,
            children: [
              _detailInfo(
                Icons.location_on_outlined,
                distance,
              ),
              _detailInfo(
                Icons.work_outline_rounded,
                jobs,
              ),
            ],
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.booking,
                  arguments: {
                    'serviceName': serviceName,
                    'price': price,
                    'providerName': name,
                    'providerRating': rating,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Select Professional',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallInfo(
    IconData icon,
    String text,
    Color color,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 15,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.5,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _detailInfo(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.slateMuted,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            color: AppColors.slateMuted,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}