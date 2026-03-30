import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/character/domain/usecase/get_character.dart';
import 'package:rick_and_morty/feature/character/presentation/bloc/character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this._id, required this._getCharacter})
    : super(CharacterInitial());

  final int _id;
  final GetCharacter _getCharacter;

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
}
