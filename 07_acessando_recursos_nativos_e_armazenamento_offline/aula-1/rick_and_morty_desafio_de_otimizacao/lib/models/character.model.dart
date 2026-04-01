// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final String image;
  final String gender;
  final String status;
  final String species;
  final Color backgroundColor;
  final Color textColor;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.status,
    required this.species,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      gender: map['gender'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
    );
  }

  Character copyWith({
    int? id,
    String? name,
    String? image,
    String? gender,
    String? status,
    String? species,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      species: species ?? this.species,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
