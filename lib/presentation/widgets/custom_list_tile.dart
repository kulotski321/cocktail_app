import 'package:cocktail_app/blocs/category/category_bloc.dart';
import 'package:cocktail_app/blocs/drink_list/drink_list_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/drink_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListTile extends StatelessWidget {
  final List<Drink> list;
  final DrinkFieldType drinkFieldType;

  const CustomListTile(
      {super.key, required this.list, required this.drinkFieldType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: ((context, index) {
        return _buildFieldTypeText(context, list, drinkFieldType, index);
      }),
    );
  }

  Widget _buildFieldTypeText(BuildContext context, List<Drink> list,
      DrinkFieldType drinkFieldType, int index) {
    switch (drinkFieldType) {
      case DrinkFieldType.category:
        var categoryName = list[index].category.toString();
        return ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            categoryName,
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DrinkListBloc()
                  ..add(SearchByCategory(categoryName: categoryName)),
                child: DrinkListScreen(
                  title: categoryName,
                ),
              ),
            ),
          ),
        );
      case DrinkFieldType.glass:
        var glassName = list[index].glass.toString();
        return ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            list[index].glass.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) =>
                    DrinkListBloc()..add(SearchByGlass(glassName: glassName)),
                child: DrinkListScreen(
                  title: glassName,
                ),
              ),
            ),
          ),
        );
      case DrinkFieldType.alcoholic:
        var alcoholicOption = list[index].alcholic.toString();
        return ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            list[index].alcholic.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DrinkListBloc()
                  ..add(SearchByAlcoholic(alcoholicOption: alcoholicOption)),
                child: DrinkListScreen(
                  title: alcoholicOption,
                ),
              ),
            ),
          ),
        );
      case DrinkFieldType.ingredient:
        var ingredientName = list[index].ingredients.toString();
        return ListTile(
          leading: const Icon(Icons.chevron_right),
          title: Text(
            list[index].ingredients.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DrinkListBloc()
                  ..add(SearchByIngredient(ingredientName: ingredientName)),
                child: DrinkListScreen(
                  title: ingredientName,
                ),
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
