import 'package:movie_recommend/shared/models/user_model.dart';

abstract class ILocalStorageService {
  Future<UserModel> add(UserModel u);
  update(UserModel u);
  Future<UserModel> getUserLogado();
}
