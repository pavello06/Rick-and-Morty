import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    required List<Character> characters,
    required String? nextPage,
    @Default(false) bool isLoading,
    Failure? failure,
  }) = HomeLoaded;

  const factory HomeState.error({required Failure failure}) = HomeError;
}
