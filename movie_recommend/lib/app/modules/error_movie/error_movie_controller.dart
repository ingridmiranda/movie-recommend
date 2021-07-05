import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'error_movie_controller.g.dart';

@Injectable()
class ErrorMovieController = _ErrorMovieControllerBase
    with _$ErrorMovieController;

abstract class _ErrorMovieControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
