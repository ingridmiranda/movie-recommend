import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_movie.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
import 'package:movie_recommend/shared/constants.dart';

part 'list_controller.g.dart';

@Injectable()
class ListController = _ListControllerBase with _$ListController;

abstract class _ListControllerBase with Store {
  String language = 'language'.i18n();

  @observable
  ObservableList<ChosenMovie> chosenMovie = ObservableList<ChosenMovie>();

  @observable
  ObservableList<ChosenSerie> chosenSerie = ObservableList<ChosenSerie>();
  

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> getSeriesMovies(String search) async {
    int length;
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps  
          'https://api.themoviedb.org/3/search/multi?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&query=${search}&page=1&include_adult=false');
      if (response.data['total_results'] > 0) {
        print("Search Series or Movies");
        print(response.data['results']);
        if (response.data['total_results'] < 20){
          length = response.data['total_results'];
        } else {
          length = 20;
        }
        for (int i=0; i<length; i++){
        if (response.data['results'][i]['media_type'] == "movie"){
          ChosenMovie movie = ChosenMovie.fromMap(response.data['results'][i]);
          print("MOVIE");
          chosenMovie.add(movie);
        } else if (response.data['results'][i]['media_type'] == "tv"){
          ChosenSerie serie = ChosenSerie.fromMap(response.data['results'][i]);
          print("SERIE");
          chosenSerie.add(serie);
        }}

      }
    } catch (e) {
      print(e);
    }
  }
}
