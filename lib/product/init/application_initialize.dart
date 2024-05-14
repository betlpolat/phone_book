import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await SharedCacheManager.instance.init();
  }
}
