import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'name')
enum CharacterGender {
  @JsonValue('Male')
  male,

  @JsonValue('Female')
  female,

  @JsonValue('Genderless')
  genderless,

  @JsonValue('unknown')
  unknown,
}
