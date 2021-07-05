import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';
import 'splash_controller.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  Timer _timer;
  _SplashPageState(){
    _timer = new Timer(const Duration(milliseconds: 2000), () async{
      //Modular.to.pushReplacementNamed("/onboard");
      await loadConfig();
    });
  }

  ReactionDisposer disposer;


loadConfig() async{
  await Localization.configuration(
    translationLocale: "assets/language", defaultLang: "en_US");

  final pathDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(pathDir.path);
  var box = await Hive.openBox('isInitialized');
  //var num = box.put('number', 0);
  var num = box.get('number');
  if (box.get('number') != null){
    num = box.get('number') + 1;
    box.put('number', num);
    Modular.to.pushReplacementNamed("/login");
  } else {
    box.put('number', 0);
    Modular.to.pushReplacementNamed("/onboard");

  }
}

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    _timer.cancel();
  }
}
