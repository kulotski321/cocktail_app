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
}

class NetworkError extends Error {}
