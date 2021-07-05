// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListController = BindInject(
  (i) => ListController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on _ListControllerBase, Store {
  final _$chosenMovieAtom = Atom(name: '_ListControllerBase.chosenMovie');

  @override
  ObservableList<ChosenMovie> get chosenMovie {
    _$chosenMovieAtom.reportRead();
    return super.chosenMovie;
  }

  @override
  set chosenMovie(ObservableList<ChosenMovie> value) {
    _$chosenMovieAtom.reportWrite(value, super.chosenMovie, () {
      super.chosenMovie = value;
    });
  }

  final _$chosenSerieAtom = Atom(name: '_ListControllerBase.chosenSerie');

  @override
  ObservableList<ChosenSerie> get chosenSerie {
    _$chosenSerieAtom.reportRead();
    return super.chosenSerie;
  }

  @override
  set chosenSerie(ObservableList<ChosenSerie> value) {
    _$chosenSerieAtom.reportWrite(value, super.chosenSerie, () {
      super.chosenSerie = value;
    });
  }

  final _$valueAtom = Atom(name: '_ListControllerBase.value');

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

  final _$getSeriesMoviesAsyncAction =
      AsyncAction('_ListControllerBase.getSeriesMovies');

  @override
  Future<void> getSeriesMovies(String search) {
    return _$getSeriesMoviesAsyncAction
        .run(() => super.getSeriesMovies(search));
  }

  final _$_ListControllerBaseActionController =
      ActionController(name: '_ListControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ListControllerBaseActionController.startAction(
        name: '_ListControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chosenMovie: ${chosenMovie},
chosenSerie: ${chosenSerie},
value: ${value}
    ''';
  }
}
