import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/choices/list_actors/actor_info.dart';
import 'package:localization/localization.dart';

//Arquivo de constantes
import 'package:movie_recommend/shared/constants.dart';
part 'list_actors_controller.g.dart';

@Injectable()
class ListActorsController = _ListActorsControllerBase
    with _$ListActorsController;

abstract class _ListActorsControllerBase with Store {
  String language = 'language'.i18n();

  @observable
  ObservableList<ActorInfo> listaActor = ObservableList<ActorInfo>();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> getActorID(String nome) async {
    try {
      Response response = await Dio().get(
          // ignore: unnecessary_brace_in_string_interps
          'https://api.themoviedb.org/3/search/person?api_key=${Constants.API_DBMOVE_KEY}&language=${language}&query=${nome}&page=1&include_adult=false');
      if (response.data['total_results'] > 0) {
        List<ActorInfo> r = (response.data['results'] as List)
            .map((e) => new ActorInfo.fromMap(e as Map<String, dynamic>))
            .toList();
        //Convierter o tipo de lista
        //listaActor = ObservableList.of(r);
        listaActor.addAll(r);
        //listaActor.removeWhere((item) => item.profile_path == null);
        print(listaActor.length);
      }
    } catch (e) {
      print(e);
    }
  }
}
