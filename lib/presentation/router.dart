import 'package:go_router/go_router.dart';
import 'package:recipes_app/presentation/details/recipe_details_screen.dart';
import 'package:recipes_app/presentation/list/recipes_list_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const RecipesListScreen(),
    ),

    GoRoute(
      path: '/recipe/:id',
      name: 'recipe',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RecipeDetailsScreen(id: id);
      },
    ),
  ],
  debugLogDiagnostics: true,
);
