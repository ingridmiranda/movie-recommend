import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'search_controller.g.dart';

@Injectable()
class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
