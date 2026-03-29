import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/favorite/domain/usecase/get_favorite_character_list.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_state.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/usecase/delete_character.dart';
import 'package:rick_and_morty/shared/domain/usecase/save_character.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required this._getFavoriteCharacterList,
    required this._saveCharacter,
    required this._deleteCharacter,
  }) : super(FavoriteInitial());

  final GetFavoriteCharacterList _getFavoriteCharacterList;
  final SaveCharacter _saveCharacter;
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

  Future<void> toggleCharacter(Character character) async {
    final currentState = state;
    if (currentState is! FavoriteLoaded) {
      return;
    }

    final result = await (character.isFavorite
        ? _deleteCharacter(character.id)
        : _saveCharacter(character));

    if (!isClosed) {
      emit(
        result.fold((failure) => FavoriteError(failure: failure), (_) {
          final characters = [...currentState.characters];
          characters.removeWhere((c) => c.id == character.id);

          return currentState.copyWith(characters: characters);
        }),
      );
    }
  }
}
