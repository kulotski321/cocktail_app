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

  Future<Drink> fetchDrinkDetails(String drinkName) async {
    Drinks drinks;
    try {
      final response = await _dio.get('$_baseUrl/search.php?s=$drinkName');
      if (response.statusCode == 200) {
        drinks = Drinks.fromMap(response.data);
        return drinks.drinks[0];
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
        // Sort categories
        categories.drinks.sort(
          (a, b) => a.category.toString().toLowerCase().compareTo(
                b.category.toString().toLowerCase(),
              ),
        );
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
        // Sort glasses
        glasses.drinks.sort(
          (a, b) => a.glass.toString().toLowerCase().compareTo(
                b.glass.toString().toLowerCase(),
              ),
        );
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
        // Sort alcoholics
        alcoholic.drinks.sort(
          (a, b) => a.alcholic.toString().toLowerCase().compareTo(
                b.alcholic.toString().toLowerCase(),
              ),
        );
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
        // Sort ingredients
        ingredients.drinks.sort(
          (a, b) => a.ingredients.toString().toLowerCase().compareTo(
                b.ingredients.toString().toLowerCase(),
              ),
        );
        return ingredients.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> filterByCategory(String categoryName) async {
    Drinks drinks;
    try {
      final response = await _dio.get('$_baseUrl/filter.php?c=$categoryName');
      if (response.statusCode == 200) {
        drinks = Drinks.fromMap(response.data);
        // Sort title
        drinks.drinks.sort(
          (a, b) => a.title.toString().toLowerCase().compareTo(
                b.title.toString().toLowerCase(),
              ),
        );
        return drinks.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> filterByGlass(String glassName) async {
    Drinks drinks;
    try {
      final response = await _dio.get('$_baseUrl/filter.php?g=$glassName');
      if (response.statusCode == 200) {
        drinks = Drinks.fromMap(response.data);
        // Sort title
        drinks.drinks.sort(
          (a, b) => a.title.toString().toLowerCase().compareTo(
                b.title.toString().toLowerCase(),
              ),
        );
        return drinks.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> filterByAlcoholic(String alcoholicOption) async {
    Drinks drinks;
    try {
      final response =
          await _dio.get('$_baseUrl/filter.php?a=$alcoholicOption');
      if (response.statusCode == 200) {
        drinks = Drinks.fromMap(response.data);
        // Sort title
        drinks.drinks.sort(
          (a, b) => a.title.toString().toLowerCase().compareTo(
                b.title.toString().toLowerCase(),
              ),
        );
        return drinks.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }

  Future<List<Drink>> filterByIngredient(String ingredientName) async {
    Drinks drinks;
    try {
      final response = await _dio.get('$_baseUrl/filter.php?i=$ingredientName');
      if (response.statusCode == 200) {
        drinks = Drinks.fromMap(response.data);
        // Sort title
        drinks.drinks.sort(
          (a, b) => a.title.toString().toLowerCase().compareTo(
                b.title.toString().toLowerCase(),
              ),
        );
        return drinks.drinks;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    throw '';
  }
}
