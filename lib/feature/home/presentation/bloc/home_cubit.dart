import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/get_character_page.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/update_character_list.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_state.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/domain/usecase/delete_character.dart';
import 'package:rick_and_morty/shared/domain/usecase/save_character.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this._getCharacterPage,
    required this._saveCharacter,
    required this._deleteCharacter,
    required this._updateCharacterList,
  }) : super(HomeInitial());

  final GetCharacterPage _getCharacterPage;
  final SaveCharacter _saveCharacter;
  final DeleteCharacter _deleteCharacter;
  final UpdateCharacterList _updateCharacterList;
  bool _isThrottled = false;
  static const _throttleDuration = Duration(seconds: 2);

  Future<void> init() async {
    emit(HomeLoading());

    final result = await _getCharacterPage();

    if (!isClosed) {
      emit(
        result.fold(
          (failure) => HomeError(failure: failure),
          (characterPage) => HomeLoaded(
            characters: characterPage.results,
            nextPage: characterPage.info.next,
          ),
        ),
      );
    }
  }

  Future<void> update() async {
    final currentState = state;
    if (currentState is! HomeLoaded ||
        currentState.nextPage == null ||
        currentState.isLoading) {
      return;
    }

    final result = await _updateCharacterList(currentState.characters);

    if (!isClosed) {
      emit(
        result.fold((failure) => HomeError(failure: failure), (characters) {
          return HomeLoaded(
            characters: characters,
            nextPage: currentState.nextPage,
          );
        }),
      );
    }
  }

  Future<void> getNextCharacterPage() async {
    final currentState = state;
    if (currentState is! HomeLoaded ||
        currentState.nextPage == null ||
        currentState.isLoading) {
      return;
    }

    emit(currentState.copyWith(isLoading: true, failure: null));

    if (_isThrottled) {
      await Future.delayed(_throttleDuration, () {
        _isThrottled = false;
      });
    }
    _isThrottled = true;
    final result = await _getCharacterPage(currentState.nextPage);

    if (!isClosed) {
      emit(
        result.fold(
          (failure) =>
              currentState.copyWith(isLoading: false, failure: failure),
          (characterPage) => currentState.copyWith(
            characters: [...currentState.characters, ...characterPage.results],
            nextPage: characterPage.info.next,
            isLoading: false,
            failure: null
          ),
        ),
      );
    }
  }

  Future<void> toggleCharacter(Character character) async {
    final currentState = state;
    if (currentState is! HomeLoaded) {
      return;
    }

    final result = await (character.isFavorite
        ? _deleteCharacter(character.id)
        : _saveCharacter(character));

    if (!isClosed) {
      emit(
        result.fold((failure) => currentState.copyWith(failure: failure), (_) {
          final newCharacter = character.copyWith(
            isFavorite: !character.isFavorite,
          );
          final characters = currentState.characters
              .map((c) => c.id == character.id ? newCharacter : c)
              .toList();

          return currentState.copyWith(characters: characters);
        }),
      );
    }
  }
}
