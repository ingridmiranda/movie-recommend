// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$isLogedAtom = Atom(name: '_LoginControllerBase.isLoged');

  @override
  bool get isLoged {
    _$isLogedAtom.reportRead();
    return super.isLoged;
  }

  @override
  set isLoged(bool value) {
    _$isLogedAtom.reportWrite(value, super.isLoged, () {
      super.isLoged = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$addUserAsyncAction = AsyncAction('_LoginControllerBase.addUser');

  @override
  Future<dynamic> addUser(auth.User user) {
    return _$addUserAsyncAction.run(() => super.addUser(user));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void changeLoged({bool change}) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeLoged');
    try {
      return super.changeLoged(change: change);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoged: ${isLoged},
user: ${user}
    ''';
  }
}
