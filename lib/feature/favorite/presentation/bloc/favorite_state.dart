import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;

  const factory FavoriteState.loading() = FavoriteLoading;

  const factory FavoriteState.loaded({required List<Character> characters}) =
      FavoriteLoaded;

  const factory FavoriteState.error({required Failure failure}) = FavoriteError;
}
