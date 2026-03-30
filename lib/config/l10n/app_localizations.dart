import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @characterGenderMale.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get characterGenderMale;

  /// No description provided for @characterGenderFemale.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get characterGenderFemale;

  /// No description provided for @characterGenderGenderless.
  ///
  /// In ru, this message translates to:
  /// **'Без пола'**
  String get characterGenderGenderless;

  /// No description provided for @characterGenderUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get characterGenderUnknown;

  /// No description provided for @characterStatusAlive.
  ///
  /// In ru, this message translates to:
  /// **'Живой'**
  String get characterStatusAlive;

  /// No description provided for @characterStatusDead.
  ///
  /// In ru, this message translates to:
  /// **'Мертвый'**
  String get characterStatusDead;

  /// No description provided for @characterStatusUnknown.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестно'**
  String get characterStatusUnknown;

  /// No description provided for @errorContentText.
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка. Попробуйте еще раз.'**
  String get errorContentText;

  /// No description provided for @errorContentButton.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get errorContentButton;

  /// No description provided for @errorSnackBarText.
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка.'**
  String get errorSnackBarText;

  /// No description provided for @favoriteLoadedEmptyText.
  ///
  /// In ru, this message translates to:
  /// **'Нет сохраненных персонажей.'**
  String get favoriteLoadedEmptyText;

  /// No description provided for @characterPageTitle.
  ///
  /// In ru, this message translates to:
  /// **'Персонаж'**
  String get characterPageTitle;

  /// No description provided for @characterLoadedContentOrigin.
  ///
  /// In ru, this message translates to:
  /// **'Родной мир: {origin}'**
  String characterLoadedContentOrigin(Object origin);

  /// No description provided for @characterLoadedContentLocation.
  ///
  /// In ru, this message translates to:
  /// **'Текущая локация: {location}'**
  String characterLoadedContentLocation(Object location);

  /// No description provided for @characterLoadedContentEpisode.
  ///
  /// In ru, this message translates to:
  /// **'Серия: {episode}'**
  String characterLoadedContentEpisode(Object episode);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
