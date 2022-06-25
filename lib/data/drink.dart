import 'dart:convert';

import 'package:equatable/equatable.dart';

enum DrinkFieldType {
  category,
  glass,
  alcoholic,
  ingredient,
}

// ignore: must_be_immutable
class Drink extends Equatable {
  final String? id;
  final String? title;
  final String? category;
  final String? alcholic;
  final String? glass;
  final String? ingredients;
  final String? instructions;
  final String? thumbnail;
  List<String> ingredientsList = [];
  List<String> measuresList = [];

  Drink({
    this.id,
    this.title,
    this.category,
    this.alcholic,
    this.glass,
    this.ingredients,
    this.instructions,
    this.thumbnail,
    required this.ingredientsList,
    required this.measuresList,
  });

  Drink copyWith({
    String? id,
    String? title,
    String? category,
    String? alcholic,
    String? glass,
    String? ingredients,
    String? instructions,
    String? thumbnail,
    List<String>? ingredientsList,
    List<String>? measuresList,
  }) {
    return Drink(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      alcholic: alcholic ?? this.alcholic,
      glass: glass ?? this.glass,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      thumbnail: thumbnail ?? this.thumbnail,
      ingredientsList: ingredientsList ?? this.ingredientsList,
      measuresList: measuresList ?? this.measuresList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDrink': id,
      'strDrink': title,
      'strCategory': category,
      'strAlcoholic': alcholic,
      'strGlass': glass,
      'strIngredient1': ingredients,
      'strInstructions': instructions,
      'strDrinkThumb': thumbnail,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    final parsedIngredients = parseIngredients(map);
    final parsedMeasures = parseMeasures(map);

    return Drink(
      id: map['idDrink'],
      title: map['strDrink'],
      category: map['strCategory'],
      alcholic: map['strAlcoholic'],
      glass: map['strGlass'],
      ingredients: map['strIngredient1'],
      instructions: map['strInstructions'],
      thumbnail: map['strDrinkThumb'],
      ingredientsList: parsedIngredients,
      measuresList: parsedMeasures,
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
      ingredients ?? '',
      instructions ?? '',
      thumbnail ?? '',
    ];
  }
}

List<String> parseIngredients(Map<String, dynamic> map) {
  List<String> parsedIngredients = [];
  for (var index = 1; index <= 15; index++) {
    String? ingredient = map['strIngredient$index'] as String?;
    parsedIngredients.add(ingredient ?? '');
  }
  return parsedIngredients;
}

List<String> parseMeasures(Map<String, dynamic> map) {
  List<String> parsedMeasures = [];
  for (var index = 1; index <= 15; index++) {
    String? measure = map['strMeasure$index'] as String?;
    parsedMeasures.add(measure ?? '');
  }
  return parsedMeasures;
}
