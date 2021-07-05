import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_movie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
part 'home_page_series_controller.g.dart';

@Injectable()
class HomePageSeriesController = _HomePageSeriesControllerBase
    with _$HomePageSeriesController;

abstract class _HomePageSeriesControllerBase with Store {
  String language = 'language'.i18n();
  @observable
  int value = 0;

  @observable
  ObservableList<ChosenSerie> emAlta = ObservableList<ChosenSerie>();


  @observable
  ObservableList<ChosenSerie> maisPopulares = ObservableList<ChosenSerie>();

  @observable
  ObservableList<ChosenSerie> bemAvaliados = ObservableList<ChosenSerie>();

  @observable
  ObservableList<ChosenSerie> nosCinemas = ObservableList<ChosenSerie>();

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> getBemAvaliados() async {
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps
          'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&page=1');
      if (response.data['page'] > 0) {
        List<ChosenSerie> r = (response.data['results'] as List)
            .map((e) => new ChosenSerie.fromMap(e as Map<String, dynamic>))
            .toList();
        //bemAvaliados.addAll(r);
        for (int i=0; i<10; i++){
          bemAvaliados.add(r[i]);
        }
        //print(r);
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getEmAlta() async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/trending/tv/day?api_key=${Constants.API_DBMOVE_KEY}');
      if (response.data['page'] > 0) {
        print("RESPOSTAAAAAA");
        print(response);
        List<ChosenSerie> r = (response.data['results'] as List)
            .map((e) => new ChosenSerie.fromMap(e as Map<String, dynamic>))
            .toList();
        for (int i=0; i<10; i++){
          emAlta.add(r[i]);
        }
        //emAlta.addAll(r);
      }
    } catch (e) {
      print(e);
    }
  }


  @action
  Future<void> getPopular() async {
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps
          'https://api.themoviedb.org/3/discover/tv?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&sort_by=popularity.desc&include_adult=false&include_video=false&page=1');
      if (response.data['results'] != null) {
        print("RESPOSTAAAAAA");
        print(response);
        for (int i=0; i<10; i++) {
          //if (response.data['results'][i]['vote_average'].toString().length >1) {
            ChosenSerie chosenSerie =
                ChosenSerie.fromMap(response.data['results'][i]);
            maisPopulares.add(chosenSerie);
          //}
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getNowPlaying() async {
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps
          'https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&page=1');
      if (response.data['results'] != null) {
        print(response);
        for (int i=0; i<10; i++) {
          //if (response.data['results'][i]['vote_average'].toString().length >1) {
            ChosenSerie chosenSerie =
                ChosenSerie.fromMap(response.data['results'][i]);
            nosCinemas.add(chosenSerie);
          //}
        }
        List<ChosenSerie> r = (response.data['results'] as List)
            .map((e) => new ChosenSerie.fromMap(e as Map<String, dynamic>))
            .toList();
        nosCinemas.addAll(r);
      }
    } catch (e) {
      print(e);
    }
  }
}
