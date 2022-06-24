import 'package:cocktail_app/blocs/ingredient/ingredient_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/widgets/custom_list_tile.dart';
import 'package:cocktail_app/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IngredientTab extends StatefulWidget {
  const IngredientTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IngredientTabState();
}

class _IngredientTabState extends State<IngredientTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => IngredientBloc()..add(GetAllIngredients()),
      child: BlocListener<IngredientBloc, IngredientState>(
        listener: (context, state) {
          if (state is IngredientError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<IngredientBloc, IngredientState>(
          builder: (context, state) {
            if (state is IngredientInitial || state is IngredientLoading) {
              return _buildLoading();
            } else if (state is IngredientLoaded) {
              return _buildHome(state.ingredients, DrinkFieldType.ingredient);
            } else if (state is IngredientError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildHome(List<Drink> list, DrinkFieldType drinkFieldType) =>
      CustomListTile(
        list: list,
        drinkFieldType: drinkFieldType,
      );

  Widget _buildLoading() => const CustomLoading();
}
