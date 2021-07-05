import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/actor.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_movie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/movie_genre.dart';
//import 'package:movie_recommend/app/modules/movies/movies_splash/movies.dart';
import 'package:dio/dio.dart';
import 'package:localization/localization.dart';

part 'movies_splash_controller.g.dart';

@Injectable()
class MoviesSplashController = _MoviesSplashControllerBase
    with _$MoviesSplashController;

abstract class _MoviesSplashControllerBase with Store {
  final apiKey = "6e19aef130ce51f4e6e28d45d4ebb332";
  String language = 'language'.i18n();
  int numMovieGenres = 19;

  //@observable
  //List<Movies> moviesList= [];

  @observable
  ObservableList<MovieGenre> movieGenreList = ObservableList<MovieGenre>();

  @observable
  List<int> listGenreID = [];

  @observable
  var arrayGenreID;

  @observable
  int actorID;

  //@observable
  //Movies myMovie;

  @observable
  List<ChosenMovie> chosenMovie = [];

  @observable
  List<ChosenSerie> chosenSerie = [];
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

@action Future discoverMovies (List<int> listGenre, int actorID) async{
    int randomMovie;
    int total_results;
    String url = "";
    Random random = new Random();
    int genreSize = listGenre.length;
    print("genre length:" + genreSize.toString());
    if (actorID == null){
      int randomPage = random.nextInt(30) + 1; 
      url += "&page=" + randomPage.toString();
    }//else {
    //  url += "&page=1";
    //}
    if (actorID != null){
      url += "&page=1";
      url += "&with_cast=" + actorID.toString();
      print(url);
    }
 
    if (genreSize > 0){
      String genre = listGenre[0].toString();
      for (int i = 1; i < genreSize; i++){
        genre += "%7C%7C"+listGenre[i].toString();
      }
      print("genre:::" + genre);
      url += "&with_genres=" + genre;
      print(url);
    } 
    print("actoriD:" + actorID.toString());
    print(url);
    int randomFilter = random.nextInt(1); 
    String filter;
    randomFilter == 0 ? filter = "vote_count.desc" : filter = "popularity.desc";
    print(randomFilter);

    try {
        Response response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&language=${language}&sort_by=${filter}&include_adult=false&include_video=false${url}'
        );
        print(response.request);
        print("DISCOVER MOVIES");
        print(response.data['total_results']);
        total_results = response.data['total_results'];
        print("Total Results:" + total_results.toString());
        if(total_results == 0){
          Modular.to.pushReplacementNamed("/errorMovie");
        }
        if (total_results >= 19){
          randomMovie = random.nextInt(19); 
        } else {
          randomMovie = random.nextInt(total_results);
        }
        print("Random: " + randomMovie.toString());
        //print(response.data['results'][randomMovie]);
        ChosenMovie chosen = ChosenMovie.fromMap(response.data['results'][randomMovie]);
        print(chosen);
        chosenMovie.add(chosen);
        print("CHOSEN MOVIE: "+ chosenMovie[0].title);
        List<ChosenMovie> list = (response.data['results'] as List)
            .map((e) => new ChosenMovie.fromMap(e as Map<String, dynamic>))
            .toList();
        
        if (chosenMovie != null){
          //ChosenMovie movie = chosenMovie[0];
          print(list);
          Modular.to.pushReplacementNamed("/movieRecommended", arguments: list);
    }
  
    } catch (e) {
      print(e);
    }
  }

  @action Future discoverSerie(List<int> listGenre, int actorID) async{
    int randomSerie;
    int total_results;
    String page = "";
    String url = "";
    Random random = new Random();
    int genreSize = listGenre.length;
    print("genre length:" + genreSize.toString());

    int randomPage = random.nextInt(4) + 1; 
    page += "&page=" + randomPage.toString();
    
 
    if (genreSize > 0){
      String genre = listGenre[0].toString();
      for (int i = 1; i < genreSize; i++){
        genre += "%7C%7C"+listGenre[i].toString();
      }
      print("genre:::" + genre);
      url += "&with_genres=" + genre;
      print(url);
    } 
 

    try {
        Response response = await Dio().get(
        //'https://api.themoviedb.org/3/discover/tv?api_key=6e19aef130ce51f4e6e28d45d4ebb332&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false'
        'https://api.themoviedb.org/3/discover/tv?api_key=${apiKey}&language=${language}&sort_by=popularity.desc${page}&timezone=America%2FNew_York${url}'
        //https://api.themoviedb.org/3/discover/tv?api_key=6e19aef130ce51f4e6e28d45d4ebb332&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&with_genres=36
        //'https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&language=${language}&sort_by=${filter}&include_adult=false&include_video=false${url}'
        );
        print(response.request);
        print("DISCOVER SERIES");
        print(response.data['total_results']);
        print("Pages: " + response.data['total_pages'].toString());
        total_results = response.data['total_results'];
        print("Total Results:" + total_results.toString());
        if(total_results == 0){
          Modular.to.pushReplacementNamed("/errorMovie");
        }
        if (total_results >= 19){
          randomSerie = random.nextInt(19); 
        } else {
          randomSerie = random.nextInt(total_results);
        }
        print("Random: " + randomSerie.toString());
        //print(response.data['results'][randomMovie]);
        print("aqui");
        ChosenSerie chosen = ChosenSerie.fromMap(response.data['results'][randomSerie]);
        print("!");
        chosenSerie.add(chosen);
        print("CHOSEN SERIE: "+ chosenSerie[0].name);
        List<ChosenSerie> list = (response.data['results'] as List)
            .map((e) => new ChosenSerie.fromMap(e as Map<String, dynamic>))
            .toList();
        if (list != null){
          print(list);
          print(list.length);
          Modular.to.pushReplacementNamed("/serieRecommended", arguments: list);
    }
  
    } catch (e) {
      print(e);
    }
  }
  /*
  @action
  Future getMovieGenreID(List<String> listGenre) async{
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=${apiKey}&language=${language}');
        print(response.data['genres'][0]);
        int i = 0;
        while (i<numMovieGenres){
          MovieGenre movieGenre = MovieGenre.fromMap(response.data['genres'][i]);
          movieGenreList.add(movieGenre);
          print(movieGenreList[i].name);
          i++;
        }
        for (i=0; i<(movieGenreList.length-1); i++){
          for (int j=0; j<listGenre.length; j++){
            print(i);
          if (movieGenreList[i].name == listGenre[j]){
            //print("BBBBBBBBBB");
            listGenreID.add(movieGenreList[i].id);
          }}}
          for (int i=0; i<listGenreID.length; i++){
            print("Genre ID:"+listGenreID[i].toString());
          }

    } catch (e) {
      print(e);
    }
  }  

  @action
  Future getActorID(String nome) async{
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/search/person?api_key=${apiKey}&language=${language}&query=${nome}&page=1&include_adult=false');
      if (response.data['total_results'] > 0){
        //print(response.data['results'][0]);
        Actor actor = Actor.fromMap(response.data['results'][0]);
        actorID = actor.id;
        print("Actor ID: " + actor.id.toString());
      }
    } catch (e) {
      print(e);
    }
  }  

  @action
  Future getMovies(String nome) async{
    try {
      print("nome: " +nome);
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/search/person?api_key=${apiKey}&language=${language}&query=${nome}&page=1&include_adult=false');
      print("nome: " +nome);
      print(response.data['total_results']);
      if (response.data['total_results'] > 0){
        print(response.data['results'][0]['known_for']);
        Movies m = Movies.fromMap(response.data['results'][0]['known_for'][0]);
        myMovie = Movies.fromMap(response.data['results'][0]['known_for'][0]);
        moviesList.add(m);
        print(m.backdropPath);
      }
    } catch (e) {
      print(e);
    }
  }  
*/
  
}
