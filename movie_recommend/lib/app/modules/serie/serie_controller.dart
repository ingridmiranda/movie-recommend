import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/movies/reviews.dart';
import 'package:movie_recommend/app/modules/movies/providers.dart';

part 'serie_controller.g.dart';

@Injectable()
class SerieController = _SerieControllerBase with _$SerieController;

String language = 'language'.i18n();

abstract class _SerieControllerBase with Store {
  @observable
  int value = 0;

  @observable
  bool tapTrailer = false;

  @observable
  bool tapReviews = false;

  @observable
  String video;

  ObservableList<Reviews> reviews = ObservableList<Reviews>();

  ObservableList<Providers> providers = ObservableList<Providers>();


  @observable
  bool isReview = false;


  @action
  void increment() {
    value++;
  }

 @action
  Future getVideo(int serieID) async{
    try {
      Response response = await Dio().get(        
        'https://api.themoviedb.org/3/tv/${serieID}/videos?api_key=${Constants.API_DBMOVE_KEY}&language=${language}');
      print(response.request);
        print("GET VIDEO");
        print(response.data['results']);
        if (response.data['results'] != null){
          print("aqui");
          video = response.data['results'][0]['key'];
          print(video);
        }
  
    } catch (e) {
      print(e);
    }
  }

  @action
  Future getReviews(int serieID) async{
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/tv/${serieID}/reviews?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&page=1');
      print(response.request);
        print("GET REVIEWS");
        print(response.data['results']);
        int total_results = response.data['total_results'];
        if (response.data['total_results'] > 0) {
        List<Reviews> r = (response.data['results'] as List)
            .map((e) => new Reviews.fromMap(e as Map<String, dynamic>))
            .toList();
        reviews.addAll(r);
        isReview = true;
        print(reviews);
        }
  
    } catch (e) {
      print(e);
    }
  }

  @action 
  Future getWatchProviders(int serieID) async{
    try {
      Response response = await Dio().get('https://api.themoviedb.org/3/tv/${serieID}/watch/providers?api_key=${Constants.API_DBMOVE_KEY}');   
      print(response);
      print("GET WATCH PROVIDERS");
      List<Providers> providersFlatrate = [];
      List<Providers> providersBuy = [];
      List<Providers> providersRent = [];
      if (response.data['results'] != null){
        if (language == "pt-BR"){
          if (response.data['results']['BR'] != null){
            if (response.data['results']['BR']['rent'] != null){
              print(response.data['results']['BR']['rent']);
              providersRent = (response.data['results']['BR']['rent'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersRent);
              }
            if (response.data['results']['BR']['buy'] != null){
              providersBuy = (response.data['results']['BR']['buy'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersBuy);
              }
            if (response.data['results']['BR']['flatrate'] != null){
              providersFlatrate = (response.data['results']['BR']['flatrate'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersFlatrate);
              }    
            }
          }
        
        if (language == "en-US"){
          if (response.data['results']['US'] != null){
            if (response.data['results']['US']['flatrate'] != null){
              providersFlatrate = (response.data['results']['US']['flatrate'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersFlatrate);
              }
            if (response.data['results']['US']['buy'] != null){
              providersBuy = (response.data['results']['US']['buy'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersBuy);
              }
            if (response.data['results']['US']['rent'] != null){
              providersRent = (response.data['results']['US']['rent'] as List)
              .map((e) => Providers.fromMap(e as Map<String, dynamic>))
              .toList();
              print(providersRent);
              }
          }
        }

        List<Providers> p = [...providersFlatrate, ...providersRent, ...providersBuy].toSet().toList(); 
        providers.addAll(p);
        print(providers);
    }
    } catch (e) {
      print(e);
    }
   }
}
