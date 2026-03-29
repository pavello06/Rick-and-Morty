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
    isFavorite: dto.isFavorite,
  );

  static CharacterDto toDto(Character character) => CharacterDto(
    id: character.id,
    name: character.name,
    status: character.status,
    species: character.species,
    type: character.type,
    gender: character.gender,
    origin: LocationMapper.toDto(character.origin),
    location: LocationMapper.toDto(character.location),
    image: character.image,
    episode: character.episode,
    url: character.url,
    created: character.created,
    isFavorite: character.isFavorite,
  );
}
