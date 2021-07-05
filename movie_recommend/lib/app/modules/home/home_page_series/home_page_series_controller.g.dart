// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_series_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomePageSeriesController = BindInject(
  (i) => HomePageSeriesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageSeriesController on _HomePageSeriesControllerBase, Store {
  final _$valueAtom = Atom(name: '_HomePageSeriesControllerBase.value');

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

  final _$emAltaAtom = Atom(name: '_HomePageSeriesControllerBase.emAlta');

  @override
  ObservableList<ChosenSerie> get emAlta {
    _$emAltaAtom.reportRead();
    return super.emAlta;
  }

  @override
  set emAlta(ObservableList<ChosenSerie> value) {
    _$emAltaAtom.reportWrite(value, super.emAlta, () {
      super.emAlta = value;
    });
  }

  final _$maisPopularesAtom =
      Atom(name: '_HomePageSeriesControllerBase.maisPopulares');

  @override
  ObservableList<ChosenSerie> get maisPopulares {
    _$maisPopularesAtom.reportRead();
    return super.maisPopulares;
  }

  @override
  set maisPopulares(ObservableList<ChosenSerie> value) {
    _$maisPopularesAtom.reportWrite(value, super.maisPopulares, () {
      super.maisPopulares = value;
    });
  }

  final _$bemAvaliadosAtom =
      Atom(name: '_HomePageSeriesControllerBase.bemAvaliados');

  @override
  ObservableList<ChosenSerie> get bemAvaliados {
    _$bemAvaliadosAtom.reportRead();
    return super.bemAvaliados;
  }

  @override
  set bemAvaliados(ObservableList<ChosenSerie> value) {
    _$bemAvaliadosAtom.reportWrite(value, super.bemAvaliados, () {
      super.bemAvaliados = value;
    });
  }

  final _$nosCinemasAtom =
      Atom(name: '_HomePageSeriesControllerBase.nosCinemas');

  @override
  ObservableList<ChosenSerie> get nosCinemas {
    _$nosCinemasAtom.reportRead();
    return super.nosCinemas;
  }

  @override
  set nosCinemas(ObservableList<ChosenSerie> value) {
    _$nosCinemasAtom.reportWrite(value, super.nosCinemas, () {
      super.nosCinemas = value;
    });
  }

  final _$getBemAvaliadosAsyncAction =
      AsyncAction('_HomePageSeriesControllerBase.getBemAvaliados');

  @override
  Future<void> getBemAvaliados() {
    return _$getBemAvaliadosAsyncAction.run(() => super.getBemAvaliados());
  }

  final _$getEmAltaAsyncAction =
      AsyncAction('_HomePageSeriesControllerBase.getEmAlta');

  @override
  Future<void> getEmAlta() {
    return _$getEmAltaAsyncAction.run(() => super.getEmAlta());
  }

  final _$getPopularAsyncAction =
      AsyncAction('_HomePageSeriesControllerBase.getPopular');

  @override
  Future<void> getPopular() {
    return _$getPopularAsyncAction.run(() => super.getPopular());
  }

  final _$getNowPlayingAsyncAction =
      AsyncAction('_HomePageSeriesControllerBase.getNowPlaying');

  @override
  Future<void> getNowPlaying() {
    return _$getNowPlayingAsyncAction.run(() => super.getNowPlaying());
  }

  final _$_HomePageSeriesControllerBaseActionController =
      ActionController(name: '_HomePageSeriesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomePageSeriesControllerBaseActionController
        .startAction(name: '_HomePageSeriesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomePageSeriesControllerBaseActionController.endAction(_$actionInfo);
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
