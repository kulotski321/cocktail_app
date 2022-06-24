import 'dart:convert';

import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  final String? id;
  final String? title;
  final String? category;
  final String? alcholic;
  final String? glass;
  final String? instructions;
  final String? thumbnail;

  const Drink({
    this.id,
    this.title,
    this.category,
    this.alcholic,
    this.glass,
    this.instructions,
    this.thumbnail,
  });

  Drink copyWith({
    String? id,
    String? title,
    String? category,
    String? alcholic,
    String? glass,
    String? instructions,
    String? thumbnail,
  }) {
    return Drink(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      alcholic: alcholic ?? this.alcholic,
      glass: glass ?? this.glass,
      instructions: instructions ?? this.instructions,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDrink': id,
      'strDrink': title,
      'strCategory': category,
      'strAlcoholic': alcholic,
      'strGlass': glass,
      'strInstructions': instructions,
      'strDrinkThumb': thumbnail,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['idDrink'],
      title: map['strDrink'],
      category: map['strCategory'],
      alcholic: map['strAlcoholic'],
      glass: map['strGlass'],
      instructions: map['strInstructions'],
      thumbnail: map['strDrinkThumb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) => Drink.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id ?? '',
      title ?? '',
      category ?? '',
      alcholic ?? '',
      glass ?? '',
      instructions ?? '',
      thumbnail ?? '',
    ];
  }
}
