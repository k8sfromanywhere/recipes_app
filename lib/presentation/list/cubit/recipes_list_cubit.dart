import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';
import 'package:recipes_app/domain/recipes_interactor.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_state.dart';

class RecipesListCubit extends Cubit<RecipesListState> {
  final RecipesRepository _repository;
  final RecipesInteractor _interactor;

  static const int pageSize = 10;

  List<Recipe> _raw = [];

  String _searchQuery = '';
  bool _filterWithImages = false;
  int? _filterMaxMinutes;

  bool get filterWithImages => _filterWithImages;
  int? get filterMaxMinutes => _filterMaxMinutes;

  RecipesListCubit({
    required RecipesRepository repository,
    required RecipesInteractor interactor,
  }) : _repository = repository,
       _interactor = interactor,
       super(const RecipesLoading());

  Future<void> load() async {
    emit(const RecipesLoading());

    try {
      final remote = await _repository.loadRecipes();
      _raw = remote;

      // кешируем только если API дал валидный JSON
      if (remote.isNotEmpty) {
        await _repository.saveCached(remote);
      }

      _applyAndEmit(_raw);
    } catch (e) {
      final cached = _repository.loadCached();

      if (cached.isNotEmpty) {
        _raw = cached;
        emit(RecipesOffline(cached)); // по ТЗ
        return;
      }

      emit(RecipesError("Сервер недоступен. Попробуйте позже."));
    }
  }

  Future<void> refresh() async {
    try {
      final fresh = await _repository.loadRecipes();
      _raw = fresh;
      _repository.saveCached(fresh);

      _applyAndEmit(_raw);
    } catch (_) {
      // Оставляем старые данные, просто рефреш не удался
      _applyAndEmit(_raw);
    }
  }

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
    final current = state;

    if (current is! RecipesLoaded) return;
    if (current.isLastPage || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));

    final nextPage = current.page + 1;
    final nextItems = _interactor.paginate(
      current.allRecipes,
      nextPage,
      pageSize,
    );
    emit(
      current.copyWith(
        paginated: [...current.paginated, ...nextItems],
        page: nextPage,
        isLastPage: nextItems.length < pageSize,
        isLoadingMore: false,
      ),
    );
  }

  void setSearch(String query) {
    _searchQuery = query;
    _applyAndEmit(_raw);
  }

  void setFilterWithImages(bool value) {
    _filterWithImages = value;
    _applyAndEmit(_raw);
  }

  void setFilterMaxMinutes(int? minutes) {
    _filterMaxMinutes = minutes;
    _applyAndEmit(_raw);
  }

  void resetFilters() {
    _filterWithImages = false;
    _filterMaxMinutes = null;
    _applyAndEmit(_raw);
  }
}
