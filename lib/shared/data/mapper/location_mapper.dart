import 'package:rick_and_morty/shared/data/model/location_dto.dart';
import 'package:rick_and_morty/shared/domain/entity/location.dart';

abstract class LocationMapper {
  static Location fromDto(LocationDto dto) =>
      Location(name: dto.name, url: dto.url);
}
