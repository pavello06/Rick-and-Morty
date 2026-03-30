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
    required this._updateCharacterList,
    required this._saveCharacter,
    required this._deleteCharacter,
  }) : super(HomeInitial());

  final GetCharacterPage _getCharacterPage;
  final UpdateCharacterList _updateCharacterList;
  final SaveCharacter _saveCharacter;
  final DeleteCharacter _deleteCharacter;

  bool _isThrottled = false;
  static const _throttleDuration = Duration(seconds: 2);

  Future<void> init() async {
    emit(HomeLoading());

    final result = await _getCharacterPage();

    if (!isClosed) {
      result.fold((failure) => emit(HomeError(failure: failure)), (
        characterPage,
      ) async {
        final result = await _updateCharacterList(characterPage.results);

        if (!isClosed) {
          emit(
            result.fold((failure) => HomeError(failure: failure), (characters) {
              return HomeLoaded(
                characters: characters,
                nextPage: characterPage.info.next,
              );
            }),
          );
        }
      });
    }
  }

  Future<void> update() async {
    if (state is! HomeLoaded) return;

    final loadedState = state as HomeLoaded;

    final result = await _updateCharacterList(loadedState.characters);

    if (!isClosed) {
      final loadedState = state as HomeLoaded;
      emit(
        result.fold((failure) => loadedState.copyWith(failure: failure), (
          characters,
        ) {
          return loadedState.copyWith(characters: characters);
        }),
      );
    }
  }

  Future<void> getNextCharacterPage() async {
    final loadedState = state;
    if (loadedState is! HomeLoaded ||
        loadedState.nextPage == null ||
        loadedState.isLoading) {
      return;
    }

    emit(loadedState.copyWith(isLoading: true, failure: null));

    if (_isThrottled) {
      await Future.delayed(_throttleDuration, () {
        _isThrottled = false;
      });
    }
    _isThrottled = true;
    final result = await _getCharacterPage(loadedState.nextPage);

    if (!isClosed) {
      final loadedState = state as HomeLoaded;
      emit(
        result.fold(
          (failure) => loadedState.copyWith(isLoading: false, failure: failure),
          (characterPage) => loadedState.copyWith(
            characters: [...loadedState.characters, ...characterPage.results],
            nextPage: characterPage.info.next,
            isLoading: false,
            failure: null,
          ),
        ),
      );
    }
  }

  Future<void> toggleCharacter(Character character) async {
    final result = await (character.isFavorite
        ? _deleteCharacter(character.id)
        : _saveCharacter(character));

    if (!isClosed) {
      final loadedState = state as HomeLoaded;
      emit(
        result.fold((failure) => loadedState.copyWith(failure: failure), (_) {
          final newCharacter = character.copyWith(
            isFavorite: !character.isFavorite,
          );
          final characters = loadedState.characters
              .map((c) => c.id == character.id ? newCharacter : c)
              .toList();

          return loadedState.copyWith(characters: characters);
        }),
      );
    }
  }
}
