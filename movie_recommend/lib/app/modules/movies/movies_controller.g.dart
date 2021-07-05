// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MoviesController = BindInject(
  (i) => MoviesController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesController on _MoviesControllerBase, Store {
  final _$valueAtom = Atom(name: '_MoviesControllerBase.value');

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

  final _$tapTrailerAtom = Atom(name: '_MoviesControllerBase.tapTrailer');

  @override
  bool get tapTrailer {
    _$tapTrailerAtom.reportRead();
    return super.tapTrailer;
  }

  @override
  set tapTrailer(bool value) {
    _$tapTrailerAtom.reportWrite(value, super.tapTrailer, () {
      super.tapTrailer = value;
    });
  }

  final _$tapReviewsAtom = Atom(name: '_MoviesControllerBase.tapReviews');

  @override
  bool get tapReviews {
    _$tapReviewsAtom.reportRead();
    return super.tapReviews;
  }

  @override
  set tapReviews(bool value) {
    _$tapReviewsAtom.reportWrite(value, super.tapReviews, () {
      super.tapReviews = value;
    });
  }

  final _$chosenMovieAtom = Atom(name: '_MoviesControllerBase.chosenMovie');

  @override
  ChosenMovie get chosenMovie {
    _$chosenMovieAtom.reportRead();
    return super.chosenMovie;
  }

  @override
  set chosenMovie(ChosenMovie value) {
    _$chosenMovieAtom.reportWrite(value, super.chosenMovie, () {
      super.chosenMovie = value;
    });
  }

  final _$videoAtom = Atom(name: '_MoviesControllerBase.video');

  @override
  String get video {
    _$videoAtom.reportRead();
    return super.video;
  }

  @override
  set video(String value) {
    _$videoAtom.reportWrite(value, super.video, () {
      super.video = value;
    });
  }

  final _$isReviewAtom = Atom(name: '_MoviesControllerBase.isReview');

  @override
  bool get isReview {
    _$isReviewAtom.reportRead();
    return super.isReview;
  }

  @override
  set isReview(bool value) {
    _$isReviewAtom.reportWrite(value, super.isReview, () {
      super.isReview = value;
    });
  }

  final _$getVideoAsyncAction = AsyncAction('_MoviesControllerBase.getVideo');

  @override
  Future<dynamic> getVideo(int movieID) {
    return _$getVideoAsyncAction.run(() => super.getVideo(movieID));
  }

  final _$getReviewsAsyncAction =
      AsyncAction('_MoviesControllerBase.getReviews');

  @override
  Future<dynamic> getReviews(int movieID) {
    return _$getReviewsAsyncAction.run(() => super.getReviews(movieID));
  }

  final _$getWatchProvidersAsyncAction =
      AsyncAction('_MoviesControllerBase.getWatchProviders');

  @override
  Future<dynamic> getWatchProviders(int movieID) {
    return _$getWatchProvidersAsyncAction
        .run(() => super.getWatchProviders(movieID));
  }

  final _$_MoviesControllerBaseActionController =
      ActionController(name: '_MoviesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MoviesControllerBaseActionController.startAction(
        name: '_MoviesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MoviesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
tapTrailer: ${tapTrailer},
tapReviews: ${tapReviews},
chosenMovie: ${chosenMovie},
video: ${video},
isReview: ${isReview}
    ''';
  }
}
