import 'package:cocktail_app/blocs/glass/glass_bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlassTab extends StatefulWidget {
  const GlassTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GlassTabState();
}

class _GlassTabState extends State<GlassTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => GlassBloc()..add(GetAllGlasses()),
      child: BlocListener<GlassBloc, GlassState>(
        listener: (context, state) {
          if (state is GlassError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message!),
            ));
          }
        },
        child: BlocBuilder<GlassBloc, GlassState>(
          builder: (context, state) {
            if (state is GlassInitial || state is GlassLoading) {
              return _buildLoading();
            } else if (state is GlassLoaded) {
              return _buildHome(context, state.glasses);
            } else if (state is GlassError) {
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
            glasses[index].glass.toString(),
            style: const TextStyle(fontSize: 14),
          );
        }),
      ),
    );
  }

  Widget _buildLoading() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 150,
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 150,
          ),
        ],
      );
}
