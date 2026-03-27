import 'package:rick_and_morty/shared/data/mapper/location_mapper.dart';
import 'package:rick_and_morty/shared/data/model/character_dto.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

abstract class CharacterMapper {
  static Character fromDto(CharacterDto dto) => Character(
    id: dto.id,
    name: dto.name,
    status: dto.status,
    species: dto.species,
    type: dto.type,
    gender: dto.gender,
    origin: LocationMapper.fromDto(dto.origin),
    location: LocationMapper.fromDto(dto.location),
    image: dto.image,
    episode: dto.episode,
    url: dto.url,
    created: dto.created,
  );
}
