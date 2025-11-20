import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:recipes_app/data/datasources/recipes_api.dart';
import 'package:recipes_app/data/local/recipes_cache.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';
import 'package:recipes_app/domain/recipes_interactor.dart';
import 'package:recipes_app/presentation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final dio = Dio();

  final api = RecipesApi(dio);
  final cache = RecipesCache(prefs);

  final repository = RecipesRepository(api: api, cache: cache);
  final interactor = RecipesInteractor();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              RecipesListCubit(repository: repository, interactor: interactor),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter);
  }
}
