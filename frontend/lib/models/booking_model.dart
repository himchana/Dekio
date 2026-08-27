class Booking {
  final String id;
  final String serviceName;
  final String price;
  final String providerName;
  final String providerRating;
  final String date;
  final String time;
  final String address;
  final String status;

  const Booking({
    required this.id,
    required this.serviceName,
    required this.price,
    required this.providerName,
    required this.providerRating,
    required this.date,
    required this.time,
    required this.address,
    required this.status,
  });
}