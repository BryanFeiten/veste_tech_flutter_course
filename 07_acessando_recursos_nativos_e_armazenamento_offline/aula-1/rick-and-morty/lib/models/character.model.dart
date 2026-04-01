import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String originName;
  final String lastLocationName;
  final int qtyShowed;
  final String imageUrl;
  final Color? color;

  const Character._({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.originName,
    required this.lastLocationName,
    required this.qtyShowed,
    required this.imageUrl,
    required this.color,
  });

  Character copyWith({required Color newColor}) {
    return Character._(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      originName: originName,
      lastLocationName: lastLocationName,
      qtyShowed: qtyShowed,
      imageUrl: imageUrl,
      color: newColor,
    );
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    final origin = map['origin'];
    final location = map['location'];
    final episodes = map['episode'] as List;

    final qtyShowed = episodes.length;

    return Character._(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      gender: map['gender'],
      originName: origin['name'],
      lastLocationName: location['name'],
      qtyShowed: qtyShowed,
      imageUrl: map['image'],
      color: Colors.white,
    );
  }
}
