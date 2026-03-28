import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/home/domain/usecase/get_character_page.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this._getCharacterPage}) : super(HomeInitial());

  final GetCharacterPage _getCharacterPage;

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
}
