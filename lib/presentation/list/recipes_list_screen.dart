import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_cubit.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_state.dart';

class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen({super.key});

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<RecipesListCubit>().load();

    _scroll.addListener(() {
      final cubit = context.read<RecipesListCubit>();
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 300) {
        cubit.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Рецепты')),
      body: BlocBuilder<RecipesListCubit, RecipesListState>(builder: (context, state) {
        return switch (state){
          RecipesLoading() => const Center(
            child: CircularProgressIndicator(),
          )
          
          RecipedError() => throw UnimplementedError(),
          // TODO: Handle this case.
          RecipesOffline() => throw UnimplementedError(),
          // TODO: Handle this case.
          RecipesEmpty() => throw UnimplementedError(),
          // TODO: Handle this case.
          RecipesLoaded() => throw UnimplementedError(),
        }
      }),
    );
  }
}
