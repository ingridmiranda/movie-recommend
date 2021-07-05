// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $OnboardController = BindInject(
  (i) => OnboardController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardController on _OnboardControllerBase, Store {
  final _$valueAtom = Atom(name: '_OnboardControllerBase.value');

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

  final _$_OnboardControllerBaseActionController =
      ActionController(name: '_OnboardControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_OnboardControllerBaseActionController.startAction(
        name: '_OnboardControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_OnboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
