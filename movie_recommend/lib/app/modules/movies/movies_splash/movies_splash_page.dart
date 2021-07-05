import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_recommend/app/modules/choices/argumentos.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_movie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/movie_genre.dart';
//import 'package:movie_recommend/app/modules/movies/movies_splash/movies.dart';
import 'movies_splash_controller.dart';

class MoviesSplashPage extends StatefulWidget {
  final String title;
  final argumentos;
  const MoviesSplashPage({Key key, this.title = "MoviesSplash", this.argumentos})
      : super(key: key);

  @override
  _MoviesSplashPageState createState() => _MoviesSplashPageState();
}


class _MoviesSplashPageState extends ModularState<MoviesSplashPage, MoviesSplashController> {
  //use 'controller' variable to access controller
    Timer _timer;

  _MoviesSplashPageState(){
    _timer = new Timer(const Duration(milliseconds: 2000), () async{
      await loadConfig();
    });
  }

  ReactionDisposer disposer;


loadConfig() async{
  Argumentos argumentos = widget.argumentos;
  bool isMovie = argumentos.isMovie;
  List<int> listGenreID = argumentos.listGenreID;
  bool indifferentGenre = argumentos.indifferentGenre;
  bool indifferentActor = argumentos.indifferentActor;
  int actorID = argumentos.actorID;
  print(argumentos.actor);

  if(listGenreID != null){
    if (isMovie){
      controller.discoverMovies(listGenreID, actorID);
    } else {
      controller.discoverSerie(listGenreID, actorID);
    }
  }
}



  @override
  Widget build(BuildContext context) {
    Argumentos argumentos = widget.argumentos;
    String actorName = argumentos.actor;
    //List<String> listGenre = argumentos.listGenre;
    //controller.getMovieGenreID(listGenre);
    /*if (argumentos.actor != null){
      controller.getActorID(actorName);
      print("DDDDDDDDD");
      print(controller.actorID);
    }
    */

    
    return Scaffold(
      backgroundColor: Color(0xFFA20409),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 100),
          child: widget.argumentos.isMovie == true ? Text('string-choosing-movie'.i18n(),// "Escolhendo o filme mais adequado para você...", 
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),) :
            Text('string-choosing-serie'.i18n(), // "Escolhendo a série mais adequada para você...", 
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),)
        ),
        Expanded(child: 
          Center(child:  
            SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)))
            )
            ),
        Container(
          padding: EdgeInsets.only(bottom: 100),
          child: Text('string-wait'.i18n().toUpperCase(), //"AGUARDE", 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),)
        )
      ],
      )

    );
  }

  @override
  void dispose(){
    super.dispose();
    _timer.cancel();
  }
}


