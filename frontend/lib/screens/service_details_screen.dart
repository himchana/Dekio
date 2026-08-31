import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({
    super.key,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.duration,
    required this.icon,
    required this.serviceColor,
  });

  final String serviceName;
  final String description;
  final String price;
  final String duration;
  final IconData icon;
  final Color serviceColor;

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
        title: const Text(
          'Service Details',
          style: TextStyle(
            color: AppColors.inkNavy,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            35,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  _buildServiceHeader(),

                  const SizedBox(height: 25),

                  _buildServiceInfo(isDesktop),

                  const SizedBox(height: 28),

                  _buildIncludedSection(),

                  const SizedBox(height: 28),

                  _buildProfessionals(
                    context,
                    isDesktop,
                  ),

                  const SizedBox(height: 30),

                  _buildBookButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // SERVICE HEADER
  // ==========================================================

  Widget _buildServiceHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.15,
              ),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(width: 17),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // SERVICE INFORMATION
  // ==========================================================

  Widget _buildServiceInfo(bool isDesktop) {
    if (!isDesktop) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _infoCard(
                  Icons.payments_outlined,
                  'Starting Price',
                  price,
                  AppColors.accentOrange,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _infoCard(
                  Icons.schedule_outlined,
                  'Duration',
                  duration,
                  AppColors.primaryBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _infoCard(
            Icons.star_rounded,
            'Rating',
            '4.9',
            AppColors.accentPink,
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _infoCard(
            Icons.payments_outlined,
            'Starting Price',
            price,
            AppColors.accentOrange,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _infoCard(
            Icons.schedule_outlined,
            'Duration',
            duration,
            AppColors.primaryBlue,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _infoCard(
            Icons.star_rounded,
            'Rating',
            '4.9',
            AppColors.accentPink,
          ),
        ),
      ],
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 21,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 10.5,
              color: AppColors.slateMuted,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.inkNavy,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // WHAT'S INCLUDED
  // ==========================================================

  Widget _buildIncludedSection() {
    final items = [
      'Professional cleaning equipment',
      'Trained and verified service professional',
      'Cleaning supplies included',
      'Flexible scheduling',
      'Quality-focused service',
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "What's included",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.inkNavy,
          ),
        ),

        const SizedBox(height: 13),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.borderLight,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: i == items.length - 1
                        ? 0
                        : 12,
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primaryBlue,
                        size: 19,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          items[i],
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: AppColors.inkNavy,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // PROFESSIONALS
  // ==========================================================

  Widget _buildProfessionals(
    BuildContext context,
    bool isDesktop,
  ) {
    final professionals = [
      (
        name: 'Amani Cleaning Pro',
        category: 'Home Specialist',
        rating: '4.9',
        price: 'TZS 20,000',
      ),
      (
        name: 'Bright Home Services',
        category: 'Cleaning Expert',
        rating: '4.8',
        price: 'TZS 22,000',
      ),
      (
        name: 'Fresh Space Team',
        category: 'Professional Cleaner',
        rating: '4.7',
        price: 'TZS 18,000',
      ),
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Professionals',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.inkNavy,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          'Choose a trusted professional for your service.',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.slateMuted,
          ),
        ),

        const SizedBox(height: 14),

        SizedBox(
          height: isDesktop ? 175 : 165,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: professionals.length,
            separatorBuilder: (_, index) {
              return const SizedBox(width: 12);
            },
            itemBuilder: (context, index) {
              final professional =
                  professionals[index];

              return InkWell(
                borderRadius:
                    BorderRadius.circular(18),

                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.professionalSelection,
                    arguments: {
                      'serviceName': serviceName,
                      'price': price,
                    },
                  );
                },

                child: Container(
                  width: isDesktop ? 285 : 245,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(18),
                    border: Border.all(
                      color:
                          AppColors.borderLight,
                    ),
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration:
                                BoxDecoration(
                              color: serviceColor
                                  .withValues(
                                alpha: 0.10,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person_rounded,
                              color: serviceColor,
                              size: 23,
                            ),
                          ),

                          const SizedBox(width: 11),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        professional.name,
                                        maxLines: 1,
                                        overflow:
                                            TextOverflow
                                                .ellipsis,
                                        style:
                                            const TextStyle(
                                          fontSize: 12.5,
                                          fontWeight:
                                              FontWeight.w800,
                                          color:
                                              AppColors
                                                  .inkNavy,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 4,
                                    ),

                                    const Icon(
                                      Icons
                                          .verified_rounded,
                                      size: 14,
                                      color: AppColors
                                          .primaryBlue,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 3),

                                Text(
                                  professional.category,
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow
                                          .ellipsis,
                                  style:
                                      const TextStyle(
                                    fontSize: 10.5,
                                    color: AppColors
                                        .slateMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color:
                                AppColors.accentOrange,
                            size: 15,
                          ),

                          const SizedBox(width: 3),

                          Text(
                            professional.rating,
                            style:
                                const TextStyle(
                              fontSize: 11,
                              fontWeight:
                                  FontWeight.w700,
                              color:
                                  AppColors.inkNavy,
                            ),
                          ),

                          const Spacer(),

                          Text(
                            professional.price,
                            style:
                                const TextStyle(
                              fontSize: 11,
                              fontWeight:
                                  FontWeight.w800,
                              color: AppColors
                                  .primaryBlue,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 9),

                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors
                              .primaryBlue
                              .withValues(
                            alpha: 0.08,
                          ),
                          borderRadius:
                              BorderRadius.circular(
                            9,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              'View Professional',
                              style: TextStyle(
                                fontSize: 10.5,
                                fontWeight:
                                    FontWeight.w800,
                                color: AppColors
                                    .primaryBlue,
                              ),
                            ),

                            SizedBox(width: 4),

                            Icon(
                              Icons
                                  .arrow_forward_rounded,
                              size: 13,
                              color: AppColors
                                  .primaryBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // CONTINUE TO BOOKING
  // ==========================================================

  Widget _buildBookButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.professionalSelection,
            arguments: {
              'serviceName': serviceName,
              'price': price,
            },
          );
        },

        icon: const Icon(
          Icons.people_alt_outlined,
        ),

        label: const Text(
          'Choose Professional & Continue',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}