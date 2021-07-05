import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'about_us_controller.g.dart';

@Injectable()
class AboutUsController = _AboutUsControllerBase with _$AboutUsController;

abstract class _AboutUsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
