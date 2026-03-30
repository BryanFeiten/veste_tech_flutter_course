// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "title": "Luxurious Gold Mouse",
//     "imageUrl": "https://picsum.photos/seed/AMBw1/3617/1377?grayscale&blur=10",
//     "price": "450.09",
//     "rating": 97,
//     "description": "Suppellex adeo id vergo considero color tertius voluptatum verus confugo. Adsum vulgus possimus comparo conqueror caveo cito. Amo defleo nisi quas.",
//     "id": "1"
//   },

class Place {
  final String id;
  final String title;
  final String imageUrl;
  final double? price;
  final int rating;
  final String description;

  const Place._({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.description,
  });

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place._(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      price: double.tryParse(map['price']),
      rating: map['rating'],
      description: map['description'],
    );
  }

  @override
  String toString() {
    return 'Place(id: $id, title: $title, imageUrl: $imageUrl, price: $price, rating: $rating, description: $description)';
  }
}
