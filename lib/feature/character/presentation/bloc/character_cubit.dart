import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/character/domain/usecase/get_character.dart';
import 'package:rick_and_morty/feature/character/presentation/bloc/character_state.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/usecase/delete_character.dart';
import 'package:rick_and_morty/shared/domain/usecase/save_character.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({
    required this._id,
    required this._getCharacter,
    required this._saveCharacter,
    required this._deleteCharacter,
  }) : super(CharacterInitial());

  final int _id;
  final GetCharacter _getCharacter;
  final SaveCharacter _saveCharacter;
  final DeleteCharacter _deleteCharacter;

  Future<void> init() async {
    emit(CharacterLoading());

    final result = await _getCharacter(_id);

    if (!isClosed) {
      emit(
        result.fold(
          (failure) => CharacterError(failure: failure),
          (character) => CharacterLoaded(character: character),
        ),
      );
    }
  }

  Future<void> toggleCharacter(Character character) async {
    final result = await (character.isFavorite
        ? _deleteCharacter(character.id)
        : _saveCharacter(character));

    if (!isClosed) {
      final loadedState = state as CharacterLoaded;
      emit(
        result.fold((failure) => CharacterError(failure: failure), (_) {
          final newCharacter = character.copyWith(
            isFavorite: !character.isFavorite,
          );

          return loadedState.copyWith(character: newCharacter);
        }),
      );
    }
  }
}
