// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$valueAtom = Atom(name: '_HomeControllerBase.value');

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

  final _$emAltaAtom = Atom(name: '_HomeControllerBase.emAlta');

  @override
  ObservableList<ChosenMovie> get emAlta {
    _$emAltaAtom.reportRead();
    return super.emAlta;
  }

  @override
  set emAlta(ObservableList<ChosenMovie> value) {
    _$emAltaAtom.reportWrite(value, super.emAlta, () {
      super.emAlta = value;
    });
  }

  final _$maisPopularesAtom = Atom(name: '_HomeControllerBase.maisPopulares');

  @override
  ObservableList<ChosenMovie> get maisPopulares {
    _$maisPopularesAtom.reportRead();
    return super.maisPopulares;
  }

  @override
  set maisPopulares(ObservableList<ChosenMovie> value) {
    _$maisPopularesAtom.reportWrite(value, super.maisPopulares, () {
      super.maisPopulares = value;
    });
  }

  final _$bemAvaliadosAtom = Atom(name: '_HomeControllerBase.bemAvaliados');

  @override
  ObservableList<ChosenMovie> get bemAvaliados {
    _$bemAvaliadosAtom.reportRead();
    return super.bemAvaliados;
  }

  @override
  set bemAvaliados(ObservableList<ChosenMovie> value) {
    _$bemAvaliadosAtom.reportWrite(value, super.bemAvaliados, () {
      super.bemAvaliados = value;
    });
  }

  final _$nosCinemasAtom = Atom(name: '_HomeControllerBase.nosCinemas');

  @override
  ObservableList<ChosenMovie> get nosCinemas {
    _$nosCinemasAtom.reportRead();
    return super.nosCinemas;
  }

  @override
  set nosCinemas(ObservableList<ChosenMovie> value) {
    _$nosCinemasAtom.reportWrite(value, super.nosCinemas, () {
      super.nosCinemas = value;
    });
  }

  final _$getBemAvaliadosAsyncAction =
      AsyncAction('_HomeControllerBase.getBemAvaliados');

  @override
  Future<void> getBemAvaliados() {
    return _$getBemAvaliadosAsyncAction.run(() => super.getBemAvaliados());
  }

  final _$getEmAltaAsyncAction = AsyncAction('_HomeControllerBase.getEmAlta');

  @override
  Future<void> getEmAlta() {
    return _$getEmAltaAsyncAction.run(() => super.getEmAlta());
  }

  final _$getPopularAsyncAction = AsyncAction('_HomeControllerBase.getPopular');

  @override
  Future<void> getPopular() {
    return _$getPopularAsyncAction.run(() => super.getPopular());
  }

  final _$getNowPlayingAsyncAction =
      AsyncAction('_HomeControllerBase.getNowPlaying');

  @override
  Future<void> getNowPlaying() {
    return _$getNowPlayingAsyncAction.run(() => super.getNowPlaying());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
emAlta: ${emAlta},
maisPopulares: ${maisPopulares},
bemAvaliados: ${bemAvaliados},
nosCinemas: ${nosCinemas}
    ''';
  }
}
