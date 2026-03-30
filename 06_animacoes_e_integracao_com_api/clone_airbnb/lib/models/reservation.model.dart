// ignore_for_file: public_member_api_docs, sort_constructors_first
//  {
//     "id": "1"
//     "propertyId": "propertyId 1",
//     "propertyTitle": "propertyTitle 1",
//     "propertyImage": "propertyImage 1",
//     "totalPrice": 33,
//     "bookingDate": 1774400805,
//   },

class Reservation {
  final String id;
  final String propertyTitle;
  final String propertyImageUrl;
  final double? totalPrice;
  final DateTime bookingDate;

  const Reservation._({
    required this.id,
    required this.propertyTitle,
    required this.propertyImageUrl,
    required this.totalPrice,
    required this.bookingDate,
  });

  factory Reservation.fromMap(Map<String, dynamic> map) {
    final rawTotalPrice = map['totalPrice'];

    final totalPrice = rawTotalPrice is int
        ? rawTotalPrice.toDouble()
        : double.tryParse(rawTotalPrice) ??
              int.tryParse(rawTotalPrice)?.toDouble();

    return Reservation._(
      id: map['id'],
      propertyTitle: map['propertyTitle'],
      propertyImageUrl: map['propertyImage'],
      totalPrice: totalPrice,
      bookingDate: DateTime.fromMillisecondsSinceEpoch(map['bookingDate']),
    );
  }

  @override
  String toString() {
    return 'Reservation(id: $id, propertyTitle: $propertyTitle, propertyImageUrl: $propertyImageUrl, totalPrice: $totalPrice, bookingDate: $bookingDate)';
  }
}
