import 'dart:convert';

import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  final String id;
  final String title;
  final String category;
  final String alchoholic;
  final String glass;
  final String instructions;
  final String image;
  final List<String> ingredients;
  final List<String> measures;

  const Drink({
    required this.id,
    required this.title,
    required this.category,
    required this.alchoholic,
    required this.glass,
    required this.instructions,
    required this.image,
    required this.ingredients,
    required this.measures,
  });

  Drink copyWith({
    String? id,
    String? title,
    String? category,
    String? alchoholic,
    String? glass,
    String? instructions,
    String? image,
    List<String>? ingredients,
    List<String>? measures,
  }) {
    return Drink(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      alchoholic: alchoholic ?? this.alchoholic,
      glass: glass ?? this.glass,
      instructions: instructions ?? this.instructions,
      image: image ?? this.image,
      ingredients: ingredients ?? this.ingredients,
      measures: measures ?? this.measures,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      category,
      alchoholic,
      glass,
      instructions,
      image,
      ingredients,
      measures,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'alchoholic': alchoholic,
      'glass': glass,
      'instructions': instructions,
      'image': image,
      'ingredients': ingredients,
      'measures': measures,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      alchoholic: map['alchoholic'],
      glass: map['glass'],
      instructions: map['instructions'],
      image: map['image'],
      ingredients: List<String>.from(map['ingredients']),
      measures: List<String>.from(map['measures']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) => Drink.fromMap(json.decode(source));
}
