import 'package:cocktail_app/data/drink.dart';
import 'package:flutter/material.dart';

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
        return ListTile(
          leading: const Icon(Icons.chevron_right),
          title: _buildFieldTypeText(list, drinkFieldType, index),
          onTap: () {},
        );
      }),
    );
  }

  Widget _buildFieldTypeText(
      List<Drink> list, DrinkFieldType drinkFieldType, int index) {
    switch (drinkFieldType) {
      case DrinkFieldType.category:
        return Text(
          list[index].category.toString(),
          style: const TextStyle(fontSize: 16),
        );
      case DrinkFieldType.glass:
        return Text(
          list[index].glass.toString(),
          style: const TextStyle(fontSize: 16),
        );
      case DrinkFieldType.alcoholic:
        return Text(
          list[index].alcholic.toString(),
          style: const TextStyle(fontSize: 16),
        );
      case DrinkFieldType.ingredient:
        return Text(
          list[index].ingredients.toString(),
          style: const TextStyle(fontSize: 16),
        );
      default:
        return Container();
    }
  }
}
