import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'onboard_controller.g.dart';

@Injectable()
class OnboardController = _OnboardControllerBase with _$OnboardController;

abstract class _OnboardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
