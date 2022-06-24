import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/data/drinks.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  Future<Drink> fetchRandomDrink() async {
    Drinks randomDrink;
    try {
      final response = await _dio.get('$_baseUrl/random.php');
      if (response.statusCode == 200) {
        randomDrink = Drinks.fromMap(response.data);
        return randomDrink.drinks[0];
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> fetchCategories() async {
    Drinks categories;
    try {
      final response = await _dio.get('$_baseUrl/list.php?c=list');
      if (response.statusCode == 200) {
        categories = Drinks.fromMap(response.data);
        return categories.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> fetchGlasses() async {
    Drinks glasses;
    try {
      final response = await _dio.get('$_baseUrl/list.php?g=list');
      if (response.statusCode == 200) {
        glasses = Drinks.fromMap(response.data);
        return glasses.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> fetchAlcoholics() async {
    Drinks alcoholic;
    try {
      final response = await _dio.get('$_baseUrl/list.php?a=list');
      if (response.statusCode == 200) {
        alcoholic = Drinks.fromMap(response.data);
        return alcoholic.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> fetchIngredients() async {
    Drinks ingredients;
    try {
      final response = await _dio.get('$_baseUrl/list.php?i=list');
      if (response.statusCode == 200) {
        ingredients = Drinks.fromMap(response.data);
        return ingredients.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }
}
