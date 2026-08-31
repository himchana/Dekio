import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';
import '../models/booking_model.dart';
import '../services/booking_store.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Booking? booking =
        BookingStore.instance.currentBooking;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ======================================================
      // APP BAR
      // ======================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        titleSpacing: 20,
        title: const Text(
          'My Bookings',
          style: TextStyle(
            color: AppColors.inkNavy,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            24,
            20,
            35,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  _buildHeader(),

                  const SizedBox(height: 25),

                  _buildTabs(),

                  const SizedBox(height: 20),

                  _buildBookingsContent(
                    context,
                    booking,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // HEADER
  // ==========================================================

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your bookings',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            color: AppColors.inkNavy,
            letterSpacing: -0.6,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Track and manage your cleaning service bookings.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.slateMuted,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // TABS
  // ==========================================================

  Widget _buildTabs() {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          _tabItem(
            'Upcoming',
            true,
          ),
          _tabItem(
            'Completed',
            false,
          ),
          _tabItem(
            'Cancelled',
            false,
          ),
        ],
      ),
    );
  }

  Widget _tabItem(
    String title,
    bool selected,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryBlue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w800,
            color: selected
                ? Colors.white
                : AppColors.slateMuted,
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // BOOKINGS CONTENT
  // ==========================================================

  Widget _buildBookingsContent(
    BuildContext context,
    Booking? booking,
  ) {
    if (booking == null) {
      return _buildEmptyBookings(context);
    }

    return _bookingCard(
      context: context,
      booking: booking,
    );
  }

  // ==========================================================
  // EMPTY STATE
  // ==========================================================

  Widget _buildEmptyBookings(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        24,
        35,
        24,
        30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
              size: 38,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'No bookings yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.inkNavy,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'You have no upcoming bookings.\n'
            'Choose a service and book a trusted professional.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              height: 1.5,
              color: AppColors.slateMuted,
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: 240,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.services,
                );
              },
              icon: const Icon(
                Icons.add_rounded,
                size: 20,
              ),
              label: const Text(
                'Book a Cleaning Service',
                style: TextStyle(
                  fontSize: 12.5,
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
                      BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // BOOKING CARD
  // ==========================================================

  Widget _bookingCard({
    required BuildContext context,
    required Booking booking,
  }) {
    final statusColor =
        _getStatusColor(booking.status);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // ==================================================
          // SERVICE + STATUS
          // ==================================================

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color:
                      AppColors.primaryBlue.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius:
                      BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.cleaning_services_rounded,
                  color: AppColors.primaryBlue,
                  size: 25,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.serviceName,
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: AppColors.inkNavy,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 14,
                          color:
                              AppColors.slateMuted,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            booking.providerName,
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color:
                                  AppColors.slateMuted,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(
                    alpha: 0.10,
                  ),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: Text(
                  booking.status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          const Divider(
            height: 1,
          ),

          const SizedBox(height: 13),

          // ==================================================
          // DATE / TIME / PRICE
          // ==================================================

          Row(
            children: [
              Expanded(
                child: _bookingInfo(
                  Icons.calendar_today_outlined,
                  booking.date,
                ),
              ),

              Expanded(
                child: _bookingInfo(
                  Icons.access_time_rounded,
                  booking.time,
                ),
              ),

              Text(
                booking.price,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ==================================================
          // ADDRESS
          // ==================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: AppColors.accentPink,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Address',
                        style: TextStyle(
                          fontSize: 9.5,
                          color:
                              AppColors.slateMuted,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        booking.address,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight:
                              FontWeight.w700,
                          color:
                              AppColors.inkNavy,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ==================================================
          // PROFESSIONAL
          // ==================================================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue
                  .withValues(alpha: 0.06),
              borderRadius:
                  BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.borderLight,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color:
                        AppColors.primaryBlue,
                    size: 20,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected Professional',
                        style: TextStyle(
                          fontSize: 9.5,
                          color:
                              AppColors.slateMuted,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        booking.providerName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight:
                              FontWeight.w800,
                          color:
                              AppColors.inkNavy,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.star_rounded,
                  size: 16,
                  color:
                      AppColors.accentOrange,
                ),

                const SizedBox(width: 3),

                Text(
                  booking.providerRating,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.inkNavy,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ==================================================
          // BOOKING ID
          // ==================================================

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking ID',
                style: TextStyle(
                  fontSize: 9.5,
                  color: AppColors.slateMuted,
                ),
              ),
              Text(
                booking.id,
                style: const TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.inkNavy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // BOOKING INFO
  // ==========================================================

  Widget _bookingInfo(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 15,
          color: AppColors.slateMuted,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: AppColors.slateMuted,
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // STATUS COLOR
  // ==========================================================

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;

      case 'completed':
        return AppColors.primaryBlue;

      case 'cancelled':
        return Colors.red;

      case 'pending':
      default:
        return AppColors.accentOrange;
    }
  }
}