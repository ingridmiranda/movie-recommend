import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'error_movie_controller.dart';
import 'package:localization/localization.dart';

class ErrorMoviePage extends StatefulWidget {
  final String title;
  const ErrorMoviePage({Key key, this.title = "ErrorMovie"}) : super(key: key);

  @override
  _ErrorMoviePageState createState() => _ErrorMoviePageState();
}



class _ErrorMoviePageState
    extends ModularState<ErrorMoviePage, ErrorMovieController> {
  //use 'controller' variable to access controller
  
  Future<bool> _onWillPop() async {
    print("chegou");
    Modular.to.pushReplacementNamed("/choices");
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        //appBar: AppBar(
        //  title: Text(widget.title),
        //),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 170, left: 30, right: 30, bottom: 60),
              alignment: Alignment.center,
              child: Text('string-ops'.i18n(), 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/images/ops-image.png', scale: 2.5,),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Padding(
                padding: EdgeInsets.only(bottom: 65, left: 20),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFa20409),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed("/login");
                      },
                      child: Text('button-return-menu'.i18n(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 65, right: 20),
                child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFa20409),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed("/choices");
                      },
                      child: Text('button-try-again'.i18n(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,)),
                ),
              )
            ],)
          ],
        ),
      ),
    );
  }
}
