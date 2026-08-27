import 'package:flutter/foundation.dart';

import '../models/booking_model.dart';

class BookingStore extends ChangeNotifier {
  BookingStore._();

  static final BookingStore instance = BookingStore._();

  Booking? _currentBooking;

  Booking? get currentBooking => _currentBooking;

  bool get hasBooking => _currentBooking != null;

  void saveBooking(Booking booking) {
    _currentBooking = booking;
    notifyListeners();
  }

  void clearBooking() {
    _currentBooking = null;
    notifyListeners();
  }

  void updateStatus(String status) {
    if (_currentBooking == null) return;

    _currentBooking = Booking(
      id: _currentBooking!.id,
      serviceName: _currentBooking!.serviceName,
      price: _currentBooking!.price,
      providerName: _currentBooking!.providerName,
      providerRating: _currentBooking!.providerRating,
      date: _currentBooking!.date,
      time: _currentBooking!.time,
      address: _currentBooking!.address,
      status: status,
    );

    notifyListeners();
  }
}