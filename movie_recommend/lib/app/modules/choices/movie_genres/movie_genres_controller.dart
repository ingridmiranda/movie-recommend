import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'movie_genres_controller.g.dart';

@Injectable()
class MovieGenresController = _MovieGenresControllerBase
    with _$MovieGenresController;

abstract class _MovieGenresControllerBase with Store {
  @observable
  int value = 0;

  @observable
  bool checked = false;

  @action
  void increment() {
    value++;
  }
}
