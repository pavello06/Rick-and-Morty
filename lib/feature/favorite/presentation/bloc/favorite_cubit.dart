import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/favorite/domain/usecase/get_favorite_character_list.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_state.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/usecase/delete_character.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required GetFavoriteCharacterList getFavoriteCharacterList,
    required DeleteCharacter deleteCharacter,
  }) : _getFavoriteCharacterList = getFavoriteCharacterList,
       _deleteCharacter = deleteCharacter,
       super(FavoriteInitial());

  final GetFavoriteCharacterList _getFavoriteCharacterList;
  final DeleteCharacter _deleteCharacter;

  Future<void> init() async {
    emit(FavoriteLoading());

    final result = await _getFavoriteCharacterList();

    if (!isClosed) {
      emit(
        result.fold(
          (failure) => FavoriteError(failure: failure),
          (characters) => FavoriteLoaded(characters: characters),
        ),
      );
    }
  }

  Future<void> update() async {
    await init();
  }

  Future<void> deleteCharacter(Character character) async {
    final result = await _deleteCharacter(character.id);

    if (!isClosed) {
      final loadedState = state as FavoriteLoaded;
      emit(
        result.fold((failure) => FavoriteError(failure: failure), (_) {
          final characters = loadedState.characters.toList();
          characters.removeWhere((c) => c.id == character.id);

          return loadedState.copyWith(characters: characters);
        }),
      );
    }
  }
}
