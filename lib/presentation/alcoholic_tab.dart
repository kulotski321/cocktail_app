import 'package:cocktail_app/blocs/alcoholic/alcoholic_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/widgets/custom_list_tile.dart';
import 'package:cocktail_app/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlcoholicTab extends StatefulWidget {
  const AlcoholicTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlcoholicTabState();
}

class _AlcoholicTabState extends State<AlcoholicTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => AlcoholicBloc()..add(GetAllAlcoholic()),
      child: BlocListener<AlcoholicBloc, AlcoholicState>(
        listener: (context, state) {
          if (state is AlcoholicError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<AlcoholicBloc, AlcoholicState>(
          builder: (context, state) {
            if (state is AlcoholicInitial || state is AlcoholicLoading) {
              return _buildLoading();
            } else if (state is AlcoholicLoaded) {
              return _buildHome(state.alcoholics, DrinkFieldType.alcoholic);
            } else if (state is AlcoholicError) {
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
