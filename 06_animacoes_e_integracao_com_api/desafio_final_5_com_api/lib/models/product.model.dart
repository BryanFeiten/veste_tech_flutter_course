class Product {
  final int id;
  final String name;
  final double price;
  final Img image;

  double rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.rating = 0.0,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    // Acessa a chave do jeito que vem do backend
    final id = json['id'] as int;
    final String? name = json['name2'];
    final price = json['price'] as double;

    // if (name == null) {
    //   crashlytics.sendFailure(
    //     Failure('Não veio o nome', stack: StackTrace.current),
    //   );
    // }

    return Product(
      id: id,
      name: name ?? 'Veio sem nome',
      price: price,
      image: Img.fromMap(json),
    );
  }
}

class Img {
  final String url;

  const Img(this.url);

  factory Img.fromMap(Map<String, dynamic> json) {
    return Img(json['imagePath']);
  }
}
