import 'package:rick_and_morty/feature/home/data/mapper/character_page_info_mapper.dart';
import 'package:rick_and_morty/feature/home/data/model/character_page_dto.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page.dart';
import 'package:rick_and_morty/shared/data/mapper/character_mapper.dart';

abstract class CharacterPageMapper {
  static CharacterPage fromDto(CharacterPageDto dto) => CharacterPage(
    info: CharacterPageInfoMapper.fromDto(dto.info),
    results: dto.results.map(CharacterMapper.fromDto).toList(),
  );
}