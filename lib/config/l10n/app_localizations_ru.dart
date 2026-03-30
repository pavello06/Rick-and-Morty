// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get characterGenderMale => 'Мужской';

  @override
  String get characterGenderFemale => 'Женский';

  @override
  String get characterGenderGenderless => 'Без пола';

  @override
  String get characterGenderUnknown => 'Неизвестно';

  @override
  String get characterStatusAlive => 'Живой';

  @override
  String get characterStatusDead => 'Мертвый';

  @override
  String get characterStatusUnknown => 'Неизвестно';

  @override
  String get errorContentText => 'Произошла ошибка. Попробуйте еще раз.';

  @override
  String get errorContentButton => 'Повторить';

  @override
  String get errorSnackBarText => 'Произошла ошибка.';

  @override
  String get characterPageTitle => 'Персонаж';

  @override
  String characterLoadedContentOrigin(Object origin) {
    return 'Родной мир: $origin';
  }

  @override
  String characterLoadedContentLocation(Object location) {
    return 'Текущая локация: $location';
  }

  @override
  String characterLoadedContentEpisode(Object episode) {
    return 'Серия: $episode';
  }
}
