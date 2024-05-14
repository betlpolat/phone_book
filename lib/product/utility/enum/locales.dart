import 'package:flutter/material.dart';

enum Locales {
  en(Locale('en', 'US'), 'en-US');

  const Locales(this.locale, this.code);
  final Locale locale;
  final String code;
}
