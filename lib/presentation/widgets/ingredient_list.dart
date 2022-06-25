import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/widgets/custom_bullet_item.dart';
import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final Drink drink;
  const IngredientList({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drink.ingredientsList.length,
      itemBuilder: (context, index) {
        var itemName =
            '${drink.measuresList[index]}  ${drink.ingredientsList[index]}';
        if (itemName.trim().isNotEmpty) {
          return CustomBulletItem(itemName: itemName);
        } else {
          return Container();
        }
      },
    );
  }
}
