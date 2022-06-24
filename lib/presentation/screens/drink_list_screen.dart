import 'package:cocktail_app/blocs/drink_list/drink_list_bloc.dart';
import 'package:cocktail_app/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkListScreen extends StatelessWidget {
  final String title;
  const DrinkListScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<DrinkListBloc, DrinkListState>(
        listener: (context, state) {
          if (state is DrinkListError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<DrinkListBloc, DrinkListState>(
          builder: (context, state) {
            if (state is DrinkListInitial || state is DrinkListLoading) {
              return _buildLoading();
            } else if (state is DrinkListLoaded) {
              print(state.drinks);
              return Container();
            } else if (state is DrinkListError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => const CustomLoading();
}
