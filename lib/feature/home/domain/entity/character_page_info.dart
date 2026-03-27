import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_page_info.freezed.dart';

@freezed
abstract class CharacterPageInfo with _$CharacterPageInfo {
  const factory CharacterPageInfo({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _CharacterPageInfo;
}
