import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/error/failure.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

part 'character_state.freezed.dart';

@freezed
abstract class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = CharacterInitial;

  const factory CharacterState.loading() = CharacterLoading;

  const factory CharacterState.loaded({required Character character}) =
      CharacterLoaded;

  const factory CharacterState.error({required Failure failure}) =
      CharacterError;
}
