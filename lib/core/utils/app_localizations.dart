import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app/app_constants.dart';

class AppLocalizations {
  Locale locale;

  AppLocalizations(this.locale);

  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  /// Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future load() async {
    String jsonStringValues =
    await rootBundle.loadString('assets/localization/${locale.languageCode}.json'); // add .json at the end

    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    _localizedStrings =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
    }

  String? translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  // add all languages code here
  @override
  bool isSupported(Locale locale) {
    return LanguageKeys.contains(locale.languageCode);
  }

  // load all localization files
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}