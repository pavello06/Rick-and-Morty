import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/shared/config/enum/character_gender.dart';
import 'package:rick_and_morty/shared/config/enum/character_status.dart';
import 'package:rick_and_morty/shared/domain/entity/location.dart';

part 'character.freezed.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    required Location origin,
    required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _Character;
}
