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
    var imagePreview = '${drink.thumbnail}';
    var title = drink.title.toString();
    var instructions = drink.instructions.toString();
    return SingleChildScrollView(
      child: Center(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: imagePreview,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.category),
                      label: Text(
                        drink.category.toString(),
                        style: const TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Chip(
                      avatar: const Icon(Icons.sports_bar),
                      label: Text(
                        drink.glass.toString(),
                        style: const TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Chip(
                      avatar: const Icon(Icons.water_drop),
                      label: Text(
                        drink.alcholic.toString(),
                        style: const TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    instructions,
                    style: const TextStyle(
                      fontFamily: 'Work Sans',
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        context.read<RandomBloc>().add(GetRandomDrink()),
                    child: const Text('get random drink'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => const CustomLoading();
}
