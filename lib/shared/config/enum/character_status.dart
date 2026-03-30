import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';

@JsonEnum(valueField: 'name')
enum CharacterStatus {
  @JsonValue('Alive')
  alive,

  @JsonValue('Dead')
  dead,

  @JsonValue('unknown')
  unknown;

  String title(BuildContext context) => switch (this) {
    CharacterStatus.alive => AppLocale.of(context).characterStatusAlive,
    CharacterStatus.dead => AppLocale.of(context).characterStatusDead,
    CharacterStatus.unknown => AppLocale.of(context).characterStatusUnknown,
  };
}
