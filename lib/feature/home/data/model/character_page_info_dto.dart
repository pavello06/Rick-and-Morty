import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_page_info_dto.freezed.dart';
part 'character_page_info_dto.g.dart';

@freezed
abstract class CharacterPageInfoDto with _$CharacterPageInfoDto {
  const factory CharacterPageInfoDto({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _CharacterPageInfoDto;

  factory CharacterPageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterPageInfoDtoFromJson(json);
}
