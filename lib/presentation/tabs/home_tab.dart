import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_app/blocs/random/random_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>
    with AutomaticKeepAliveClientMixin<HomeTab> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => RandomBloc()..add(GetRandomDrink()),
      child: SingleChildScrollView(
        child: BlocListener<RandomBloc, RandomState>(
          listener: (context, state) {
            if (state is RandomError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message!),
              ));
            }
          },
          child: BlocBuilder<RandomBloc, RandomState>(
            builder: (context, state) {
              if (state is RandomInitial || state is RandomLoading) {
                return _buildLoading();
              } else if (state is RandomLoaded) {
                return _buildHome(context, state.drink);
              } else if (state is RandomError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHome(BuildContext context, Drink drink) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
            width: 50,
          ),
          CachedNetworkImage(
            height: 300,
            width: 300,
            imageUrl: drink.thumbnail ?? "http://via.placeholder.com/300x300",
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            drink.title.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            drink.instructions.toString(),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          ElevatedButton(
              onPressed: () => context.read<RandomBloc>().add(GetRandomDrink()),
              child: const Text('get random drink'))
        ],
      ),
    );
  }

  Widget _buildLoading() => const CustomLoading();
}
