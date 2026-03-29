import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/shared/config/enum/character_gender.dart';
import 'package:rick_and_morty/shared/config/enum/character_status.dart';
import 'package:rick_and_morty/shared/data/model/location_dto.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    required LocationDto origin,
    required LocationDto location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
    @Default(false) bool isFavorite,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);
}
