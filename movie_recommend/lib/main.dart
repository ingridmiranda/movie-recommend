import 'dart:async';
import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommend/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_recommend/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(Constants.CRASH);
  Function origemErro = FlutterError.onError;
  FlutterError.onError = (erroDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(erroDetails);
    origemErro(erroDetails);
  };
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);
  runZoned(() {
    runApp(ModularApp(module: AppModule()));
  }, onError: FirebaseCrashlytics.instance.recordError);
}
