class Outlet {
  final int id;
  final String name;
  final double lat;
  final double lon;

  const Outlet._({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory Outlet.fromMap(Map<String, dynamic> map) {
    return Outlet._(
      id: map['id'],
      name: map['nome'],
      lat: map['latitude'],
      lon: map['longitude'],
    );
  }

  @override
  String toString() {
    return 'Outlet(id: $id, name: $name, lat: $lat, lon: $lon)';
  }
}
