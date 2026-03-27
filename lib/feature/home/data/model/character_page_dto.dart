import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/feature/home/data/model/character_page_info_dto.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';

part 'character_page_dto.freezed.dart';
part 'character_page_dto.g.dart';

@freezed
abstract class CharacterPageDto with _$CharacterPageDto {
  const factory CharacterPageDto({
    required CharacterPageInfoDto info,
    required List<CharacterDto> results,
  }) = _CharacterPageDto;

  factory CharacterPageDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterPageDtoFromJson(json);
}
