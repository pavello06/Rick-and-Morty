import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/l10n/s.dart';

@JsonEnum(valueField: 'name')
enum CharacterGender {
  @JsonValue('Male')
  male,

  @JsonValue('Female')
  female,

  @JsonValue('Genderless')
  genderless,

  @JsonValue('unknown')
  unknown;

  String title(BuildContext context) => switch (this) {
    CharacterGender.male => S.of(context).characterGenderMale,
    CharacterGender.female => S.of(context).characterGenderFemale,
    CharacterGender.genderless => S.of(context).characterGenderGenderless,
    CharacterGender.unknown => S.of(context).characterGenderUnknown,
  };
}
