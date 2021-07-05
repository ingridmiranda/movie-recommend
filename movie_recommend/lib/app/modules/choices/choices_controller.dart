import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'choices_controller.g.dart';

@Injectable()
class ChoicesController = _ChoicesControllerBase with _$ChoicesController;

abstract class _ChoicesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
