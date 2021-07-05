import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/shared/models/user_model.dart';
import 'package:movie_recommend/shared/services/interfaces/ilocal_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool isLoged = false;

  @observable
  UserModel user;

  ILocalStorageService _localStorageService;

  _LoginControllerBase() {
    _localStorageService = Modular.get<ILocalStorageService>();
    init();
  }

  void init() async {
    user = await _localStorageService.getUserLogado();
  }

  @action
  void changeLoged({bool change}) {
    isLoged = change;
  }

  @action
  Future addUser(auth.User user) async {
    this.user = await _localStorageService.add(UserModel(
        nome: user.displayName, email: user.email, foto: user.photoURL));
  }
}
