import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:cocktail_app/data/drink.dart';

// ignore: must_be_immutable
class Drinks extends Equatable {
  final List<Drink> drinks;

  const Drinks({
    required this.drinks,
  });

  @override
  List<Object> get props => [drinks];

  Map<String, dynamic> toMap() {
    return {
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory Drinks.fromMap(Map<String, dynamic> map) {
    return Drinks(
      drinks: List<Drink>.from(map['drinks']?.map((x) => Drink.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Drinks.fromJson(String source) => Drinks.fromMap(json.decode(source));
}
