import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/home/move_info.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_movie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String language = 'language'.i18n();
  @observable
  int value = 0;

  @observable
  ObservableList<ChosenMovie> emAlta = ObservableList<ChosenMovie>();

  @observable
  ObservableList<ChosenMovie> maisPopulares = ObservableList<ChosenMovie>();

  @observable
  ObservableList<ChosenMovie> bemAvaliados = ObservableList<ChosenMovie>();

  @observable
  ObservableList<ChosenMovie> nosCinemas = ObservableList<ChosenMovie>();

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> getBemAvaliados() async {
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps
          'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&page=1');
      if (response.data['page'] > 0) {
        List<ChosenMovie> r = (response.data['results'] as List)
            .map((e) => new ChosenMovie.fromMap(e as Map<String, dynamic>))
            .toList();
        for (int i=0; i<10; i++){
          bemAvaliados.add(r[i]);
        }
        //bemAvaliados.addAll(r);
        print(r);
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getEmAlta() async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.API_DBMOVE_KEY}');
      if (response.data['page'] > 0) {
        print("RESPOSTAAAAAA");
        print(response);
        List<ChosenMovie> r = (response.data['results'] as List)
            .map((e) => new ChosenMovie.fromMap(e as Map<String, dynamic>))
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
          'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&sort_by=popularity.desc&include_adult=false&include_video=false&page=1');
      if (response.data['results'] != null) {
        print("RESPOSTAAAAAA");
        print(response);
        for (int i=0; i<10; i++) {
          //if (response.data['results'][i]['vote_average'].toString().length > 1) {
            ChosenMovie chosenMovie =
                ChosenMovie.fromMap(response.data['results'][i]);
            maisPopulares.add(chosenMovie);
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
          'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&page=1');
      if (response.data['results'] != null) {
        print(response);
        for (int i=0; i<10; i++) {
          if (response.data['results'][i]['vote_average'].toString().length >
              1) {
            ChosenMovie chosenMovie =
                ChosenMovie.fromMap(response.data['results'][i]);
            nosCinemas.add(chosenMovie);
          }
        }
        List<ChosenMovie> r = (response.data['results'] as List)
            .map((e) => new ChosenMovie.fromMap(e as Map<String, dynamic>))
            .toList();
        nosCinemas.addAll(r);
      }
    } catch (e) {
      print(e);
    }
  }
}
