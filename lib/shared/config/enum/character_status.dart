import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'name')
enum CharacterStatus {
  @JsonValue('Alive')
  alive,
  
  @JsonValue('Dead')
  dead,
  
  @JsonValue('unknown')
  unknown,
}
