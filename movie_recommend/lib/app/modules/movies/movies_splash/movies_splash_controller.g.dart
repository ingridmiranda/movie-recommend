// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_splash_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MoviesSplashController = BindInject(
  (i) => MoviesSplashController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesSplashController on _MoviesSplashControllerBase, Store {
  final _$movieGenreListAtom =
      Atom(name: '_MoviesSplashControllerBase.movieGenreList');

  @override
  ObservableList<MovieGenre> get movieGenreList {
    _$movieGenreListAtom.reportRead();
    return super.movieGenreList;
  }

  @override
  set movieGenreList(ObservableList<MovieGenre> value) {
    _$movieGenreListAtom.reportWrite(value, super.movieGenreList, () {
      super.movieGenreList = value;
    });
  }

  final _$listGenreIDAtom =
      Atom(name: '_MoviesSplashControllerBase.listGenreID');

  @override
  List<int> get listGenreID {
    _$listGenreIDAtom.reportRead();
    return super.listGenreID;
  }

  @override
  set listGenreID(List<int> value) {
    _$listGenreIDAtom.reportWrite(value, super.listGenreID, () {
      super.listGenreID = value;
    });
  }

  final _$arrayGenreIDAtom =
      Atom(name: '_MoviesSplashControllerBase.arrayGenreID');

  @override
  dynamic get arrayGenreID {
    _$arrayGenreIDAtom.reportRead();
    return super.arrayGenreID;
  }

  @override
  set arrayGenreID(dynamic value) {
    _$arrayGenreIDAtom.reportWrite(value, super.arrayGenreID, () {
      super.arrayGenreID = value;
    });
  }

  final _$actorIDAtom = Atom(name: '_MoviesSplashControllerBase.actorID');

  @override
  int get actorID {
    _$actorIDAtom.reportRead();
    return super.actorID;
  }

  @override
  set actorID(int value) {
    _$actorIDAtom.reportWrite(value, super.actorID, () {
      super.actorID = value;
    });
  }

  final _$chosenMovieAtom =
      Atom(name: '_MoviesSplashControllerBase.chosenMovie');

  @override
  List<ChosenMovie> get chosenMovie {
    _$chosenMovieAtom.reportRead();
    return super.chosenMovie;
  }

  @override
  set chosenMovie(List<ChosenMovie> value) {
    _$chosenMovieAtom.reportWrite(value, super.chosenMovie, () {
      super.chosenMovie = value;
    });
  }

  final _$chosenSerieAtom =
      Atom(name: '_MoviesSplashControllerBase.chosenSerie');

  @override
  List<ChosenSerie> get chosenSerie {
    _$chosenSerieAtom.reportRead();
    return super.chosenSerie;
  }

  @override
  set chosenSerie(List<ChosenSerie> value) {
    _$chosenSerieAtom.reportWrite(value, super.chosenSerie, () {
      super.chosenSerie = value;
    });
  }

  final _$valueAtom = Atom(name: '_MoviesSplashControllerBase.value');

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

  final _$discoverMoviesAsyncAction =
      AsyncAction('_MoviesSplashControllerBase.discoverMovies');

  @override
  Future<dynamic> discoverMovies(List<int> listGenre, int actorID) {
    return _$discoverMoviesAsyncAction
        .run(() => super.discoverMovies(listGenre, actorID));
  }

  final _$discoverSerieAsyncAction =
      AsyncAction('_MoviesSplashControllerBase.discoverSerie');

  @override
  Future<dynamic> discoverSerie(List<int> listGenre, int actorID) {
    return _$discoverSerieAsyncAction
        .run(() => super.discoverSerie(listGenre, actorID));
  }

  final _$_MoviesSplashControllerBaseActionController =
      ActionController(name: '_MoviesSplashControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MoviesSplashControllerBaseActionController
        .startAction(name: '_MoviesSplashControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MoviesSplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieGenreList: ${movieGenreList},
listGenreID: ${listGenreID},
arrayGenreID: ${arrayGenreID},
actorID: ${actorID},
chosenMovie: ${chosenMovie},
chosenSerie: ${chosenSerie},
value: ${value}
    ''';
  }
}
