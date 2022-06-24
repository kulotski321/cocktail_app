import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/services/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Drink> fetchRandomDrink() {
    return _provider.fetchRandomDrink();
  }

  Future<List<Drink>> fetchCategories() {
    return _provider.fetchCategories();
  }

  Future<List<Drink>> fetchGlasses() {
    return _provider.fetchGlasses();
  }

  Future<List<Drink>> fetchAlcoholics() {
    return _provider.fetchAlcoholics();
  }

  Future<List<Drink>> fetchIngredients() {
    return _provider.fetchIngredients();
  }
}

class NetworkError extends Error {}
