import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'actors_controller.g.dart';

@Injectable()
class ActorsController = _ActorsControllerBase with _$ActorsController;

abstract class _ActorsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  
}
