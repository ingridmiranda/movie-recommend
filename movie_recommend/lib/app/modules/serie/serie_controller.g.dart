// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SerieController = BindInject(
  (i) => SerieController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SerieController on _SerieControllerBase, Store {
  final _$valueAtom = Atom(name: '_SerieControllerBase.value');

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

  final _$tapTrailerAtom = Atom(name: '_SerieControllerBase.tapTrailer');

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

  final _$tapReviewsAtom = Atom(name: '_SerieControllerBase.tapReviews');

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

  final _$videoAtom = Atom(name: '_SerieControllerBase.video');

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

  final _$isReviewAtom = Atom(name: '_SerieControllerBase.isReview');

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

  final _$getVideoAsyncAction = AsyncAction('_SerieControllerBase.getVideo');

  @override
  Future<dynamic> getVideo(int serieID) {
    return _$getVideoAsyncAction.run(() => super.getVideo(serieID));
  }

  final _$getReviewsAsyncAction =
      AsyncAction('_SerieControllerBase.getReviews');

  @override
  Future<dynamic> getReviews(int serieID) {
    return _$getReviewsAsyncAction.run(() => super.getReviews(serieID));
  }

  final _$getWatchProvidersAsyncAction =
      AsyncAction('_SerieControllerBase.getWatchProviders');

  @override
  Future<dynamic> getWatchProviders(int serieID) {
    return _$getWatchProvidersAsyncAction
        .run(() => super.getWatchProviders(serieID));
  }

  final _$_SerieControllerBaseActionController =
      ActionController(name: '_SerieControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SerieControllerBaseActionController.startAction(
        name: '_SerieControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SerieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
tapTrailer: ${tapTrailer},
tapReviews: ${tapReviews},
video: ${video},
isReview: ${isReview}
    ''';
  }
}
