import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/modals/recipe.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';
import 'package:recipes_app/domain/recipes_interactor.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_state.dart';

class RecipesListCubit extends Cubit<RecipesListState> {
  final RecipesRepository _repository;
  final RecipesInteractor _interactor;

  static const int pageSize = 10;

  String _searchQuery = '';
  bool _filterWithImages = false;
  int? _filterMaxMinutes;

  RecipesListCubit({
    required RecipesRepository repository,
    required RecipesInteractor interactor,
  }) : _repository = repository,
       _interactor = interactor,
       super(const RecipedLoading());

  Future<void> load() async {
    emit(const RecipedLoading());
    try {
      final data = await _repository.loadRecipes();
      _applyAndEmit(data);
    } catch (e) {
      final cached = _repository.loadCached();
      if (cached.isNotEmpty) {
        emit(RecipesOffline(cached));
      } else {
        emit(RecipedError(e.toString()));
      }
    }
  }

  Future<void> refresh() async => load();

  void _applyAndEmit(List<Recipe> rawList) {
    var list = _interactor.applySearch(rawList, _searchQuery);
    list = _interactor.applyFilters(
      list,
      onlyWithImages: _filterWithImages,
      maxMinutes: _filterMaxMinutes,
    );
    if (list.isEmpty) {
      emit(const RecipesEmpty());
      return;
    }
    final firstPage = _interactor.paginate(list, 0, pageSize);

    emit(
      RecipesLoaded(
        allRecipes: list,
        paginated: firstPage,
        page: 0,
        isLastPage: firstPage.length < pageSize,
        isLoadingMore: false,
      ),
    );
  }

  void loadMore() {
    final stateNow = state;
    if (stateNow is! RecipesLoaded) return;
    if (stateNow.isLastPage || stateNow.isLoadingMore) return;
    emit(stateNow.copyWith(isLoadingMore: true));
    final nextPage = stateNow.page + 1;
    final nextItems = _interactor.paginate(
      stateNow.allRecipes,
      nextPage,
      pageSize,
    );
    emit(
      stateNow.copyWith(
        paginated: [...stateNow.paginated, ...nextItems],
        page: nextPage,
        isLastPage: nextItems.length < pageSize,
        isLoadingMore: false,
      ),
    );
  }

  void setSearch(String query) {
    _searchQuery = query;
    _reloadFilters();
  }

  void setFilterMaxMinutes(int? minutes) {
    _filterMaxMinutes = minutes;
    _reloadFilters();
  }

  void _reloadFilters() {
    final cached = _repository.loadCached();
    if (cached.isEmpty) {
      emit(const RecipesEmpty());
    } else {
      _applyAndEmit(cached);
    }
  }
}
