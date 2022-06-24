import 'package:cocktail_app/blocs/alcoholic/alcoholic_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
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
              return _buildHome(context, state.alcoholics);
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

  Widget _buildHome(BuildContext context, List<Drink> glasses) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: glasses.length,
        itemBuilder: ((context, index) {
          return Text(
            glasses[index].alcholic.toString(),
            style: const TextStyle(fontSize: 14),
          );
        }),
      ),
    );
  }

  Widget _buildLoading() => const CustomLoading();
}
