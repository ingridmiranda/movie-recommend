// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genres_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MovieGenresController = BindInject(
  (i) => MovieGenresController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieGenresController on _MovieGenresControllerBase, Store {
  final _$valueAtom = Atom(name: '_MovieGenresControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$checkedAtom = Atom(name: '_MovieGenresControllerBase.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$_MovieGenresControllerBaseActionController =
      ActionController(name: '_MovieGenresControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MovieGenresControllerBaseActionController
        .startAction(name: '_MovieGenresControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MovieGenresControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
checked: ${checked}
    ''';
  }
}
