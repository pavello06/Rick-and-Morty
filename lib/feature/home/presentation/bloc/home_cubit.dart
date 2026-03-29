import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/get_character_page.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this._getCharacterPage}) : super(HomeInitial());

  final GetCharacterPage _getCharacterPage;
  bool _isThrottled = false;
  static const _throttleDuration = Duration(seconds: 1);

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
          ),
        ),
      );
    }
  }
}
