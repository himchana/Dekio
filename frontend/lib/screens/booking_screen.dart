import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';
import '../models/booking_model.dart';
import '../services/booking_store.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
    required this.serviceName,
    required this.price,
    this.providerName = 'Professional Cleaner',
    this.providerRating = '4.9',
  });

  final String serviceName;
  final String price;
  final String providerName;
  final String providerRating;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final TextEditingController addressController =
      TextEditingController();

  final TextEditingController notesController =
      TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        title: const Text(
          'Book Service',
          style: TextStyle(
            color: AppColors.inkNavy,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Book Your Service',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: AppColors.inkNavy,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Choose when and where you need your service.',
                    style: TextStyle(
                      color: AppColors.slateMuted,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 25),

                  _serviceCard(),

                  const SizedBox(height: 16),

                  _professionalCard(),

                  const SizedBox(height: 16),

                  _dateCard(),

                  const SizedBox(height: 16),

                  _timeCard(),

                  const SizedBox(height: 16),

                  TextField(
                    controller: addressController,
                    maxLines: 2,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      labelText: 'Service Address',
                      hintText: 'Enter your service address',
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primaryBlue,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: notesController,
                    maxLines: 4,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      labelText: 'Additional Notes',
                      hintText: 'Any special instructions?',
                      prefixIcon: Icon(
                        Icons.notes_outlined,
                        color: AppColors.accentPink,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.inkNavy,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Estimated Total',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: _confirmBooking,
                      icon: const Icon(
                        Icons.check_circle_outline,
                      ),
                      label: const Text(
                        'Confirm Booking',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.cleaning_services_rounded,
              color: AppColors.primaryBlue,
              size: 27,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Service',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.slateMuted,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  widget.serviceName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.inkNavy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _professionalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
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
              size: 27,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selected Professional',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.slateMuted,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  widget.providerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.inkNavy,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 15,
                      color: AppColors.accentOrange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.providerRating,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.slateMuted,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Professional',
                      style: TextStyle(
                        fontSize: 10.5,
                        color: AppColors.slateMuted,
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
  }

  Widget _dateCard() {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      leading: const Icon(
        Icons.calendar_today_outlined,
        color: AppColors.accentPink,
      ),
      title: const Text(
        'Service Date',
        style: TextStyle(
          fontSize: 12,
          color: AppColors.slateMuted,
        ),
      ),
      subtitle: Text(
        selectedDate == null
            ? 'Select date'
            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.inkNavy,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: _selectDate,
    );
  }

  Widget _timeCard() {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      leading: const Icon(
        Icons.access_time_rounded,
        color: AppColors.accentOrange,
      ),
      title: const Text(
        'Service Time',
        style: TextStyle(
          fontSize: 12,
          color: AppColors.slateMuted,
        ),
      ),
      subtitle: Text(
        selectedTime == null
            ? 'Select time'
            : selectedTime!.format(context),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.inkNavy,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: _selectTime,
    );
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(
        const Duration(days: 90),
      ),
    );

    if (picked != null && mounted) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && mounted) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmBooking() {
    final address = addressController.text.trim();

    if (selectedDate == null ||
        selectedTime == null ||
        address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.inkNavy,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.accentOrange,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Please select date, time and address.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      return;
    }

    final booking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      serviceName: widget.serviceName,
      price: widget.price,
      providerName: widget.providerName,
      providerRating: widget.providerRating,
      date:
          '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
      time: selectedTime!.format(context),
      address: address,
      status: 'Confirmed',
    );

    BookingStore.instance.saveBooking(booking);

    Navigator.pushNamed(
      context,
      AppRoutes.bookingConfirmation,
      arguments: {
        'serviceName': booking.serviceName,
        'price': booking.price,
        'providerName': booking.providerName,
        'providerRating': booking.providerRating,
        'date': booking.date,
        'time': booking.time,
        'address': booking.address,
      },
    );
  }
}