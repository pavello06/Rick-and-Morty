import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page_info.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

part 'character_page.freezed.dart';

@freezed
abstract class CharacterPage with _$CharacterPage {
  const factory CharacterPage({
    required CharacterPageInfo info,
    required List<Character> results,
  }) = _CharacterPage;
}
