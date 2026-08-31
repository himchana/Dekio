import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({
    super.key,
    required this.serviceName,
    required this.price,
    required this.date,
    required this.time,
    required this.address,
    this.providerName = 'Professional Cleaner',
    this.providerRating = '4.9',
  });

  final String serviceName;
  final String price;
  final String date;
  final String time;
  final String address;
  final String providerName;
  final String providerRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Booking Confirmation',
          style: TextStyle(
            color: AppColors.inkNavy,
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
                maxWidth: 650,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // =====================================================
                  // SUCCESS ICON
                  // =====================================================

                  Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(
                            alpha: 0.20,
                          ),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 52,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Booking Confirmed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Your cleaning service has been successfully booked.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.slateMuted,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =====================================================
                  // CONFIRMED BADGE
                  // =====================================================

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(
                        alpha: 0.10,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.green.withValues(
                          alpha: 0.25,
                        ),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'CONFIRMED',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =====================================================
                  // BOOKING DETAILS
                  // =====================================================

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: AppColors.borderLight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booking Details',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: AppColors.inkNavy,
                          ),
                        ),

                        const SizedBox(height: 20),

                        _detail(
                          Icons.cleaning_services_outlined,
                          'Service',
                          serviceName,
                          AppColors.primaryBlue,
                        ),

                        const SizedBox(height: 16),

                        _detail(
                          Icons.person_outline_rounded,
                          'Professional',
                          providerName,
                          AppColors.accentPink,
                        ),

                        const SizedBox(height: 8),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 52,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 15,
                                color: AppColors.accentOrange,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                providerRating,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      AppColors.slateMuted,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'rating',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color:
                                      AppColors.slateMuted,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        _detail(
                          Icons.calendar_today_outlined,
                          'Date',
                          date,
                          AppColors.accentPink,
                        ),

                        const SizedBox(height: 16),

                        _detail(
                          Icons.access_time_rounded,
                          'Time',
                          time,
                          AppColors.accentOrange,
                        ),

                        const SizedBox(height: 16),

                        _detail(
                          Icons.location_on_outlined,
                          'Service Address',
                          address,
                          AppColors.primaryBlue,
                        ),

                        const Divider(height: 32),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Estimated Total',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color:
                                    AppColors.inkNavy,
                              ),
                            ),
                            Text(
                              price,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color:
                                    AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // =====================================================
                  // WHAT HAPPENS NEXT
                  // =====================================================

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.inkNavy,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What happens next?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 16),

                        _StatusItem(
                          icon: Icons.check_circle_rounded,
                          text:
                              'Booking has been confirmed',
                          active: true,
                        ),

                        SizedBox(height: 13),

                        _StatusItem(
                          icon: Icons.person_rounded,
                          text:
                              'Your selected professional will prepare for the service',
                          active: true,
                        ),

                        SizedBox(height: 13),

                        _StatusItem(
                          icon:
                              Icons.notifications_outlined,
                          text:
                              'You can track your booking from My Bookings',
                          active: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // =====================================================
                  // MY BOOKINGS BUTTON
                  // =====================================================

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.customerDashboard,
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                      ),
                      label: const Text(
                        'View My Booking',
                        style: TextStyle(
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
                  ),

                  const SizedBox(height: 10),

                  // =====================================================
                  // HOME BUTTON
                  // =====================================================

                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.home_outlined,
                      size: 18,
                    ),
                    label: const Text(
                      'Back to Home',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
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

  Widget _detail(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(
              alpha: 0.10,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
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
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.inkNavy,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusItem extends StatelessWidget {
  const _StatusItem({
    required this.icon,
    required this.text,
    required this.active,
  });

  final IconData icon;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: active
              ? AppColors.accentOrange
              : Colors.white54,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: active
                  ? Colors.white
                  : Colors.white60,
              fontSize: 12,
              height: 1.35,
              fontWeight: active
                  ? FontWeight.w700
                  : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}