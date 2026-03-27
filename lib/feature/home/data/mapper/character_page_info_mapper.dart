import 'package:rick_and_morty/feature/home/data/model/character_page_info_dto.dart';
import 'package:rick_and_morty/feature/home/domain/entity/character_page_info.dart';

abstract class CharacterPageInfoMapper {
  static CharacterPageInfo fromDto(CharacterPageInfoDto dto) =>
      CharacterPageInfo(
        count: dto.count,
        pages: dto.pages,
        next: dto.next,
        prev: dto.prev,
      );
}
