import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/data/drinks.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  Future<Drink> fetchRandomDrink() async {
    Drinks allDrinks;
    try {
      final response = await _dio.get('$_baseUrl/random.php');
      if (response.statusCode == 200) {
        allDrinks = Drinks.fromMap(response.data);
        return allDrinks.drinks[0];
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
}
