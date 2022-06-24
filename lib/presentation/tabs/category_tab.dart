import 'package:cocktail_app/blocs/category/category_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/widgets/custom_list_tile.dart';
import 'package:cocktail_app/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => CategoryBloc()..add(GetAllCategories()),
      child: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryInitial || state is CategoryLoading) {
              return _buildLoading();
            } else if (state is CategoryLoaded) {
              return _buildHome(state.categories, DrinkFieldType.category);
            } else if (state is CategoryError) {
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
