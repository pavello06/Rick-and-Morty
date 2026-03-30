import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';

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
    CharacterGender.male => AppLocale.of(context).characterGenderMale,
    CharacterGender.female => AppLocale.of(context).characterGenderFemale,
    CharacterGender.genderless => AppLocale.of(context).characterGenderGenderless,
    CharacterGender.unknown => AppLocale.of(context).characterGenderUnknown,
  };
}
