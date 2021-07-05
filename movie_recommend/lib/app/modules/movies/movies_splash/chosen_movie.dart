import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChosenMovie {
  double popularity;
  int vote_count;
  String poster_path;
  int id;
  String backdrop_path;
  String original_language;
  String original_title;
  List<int> genre_ids;
  String title;
  double vote_average;
  String overview;
  String release_date;

  ChosenMovie({
    this.popularity,
    this.vote_count,
    this.poster_path,
    this.id,
    this.backdrop_path,
    this.original_language,
    this.original_title,
    this.genre_ids,
    this.title,
    this.vote_average,
    this.overview,
    this.release_date,
  });

  ChosenMovie copyWith({
    double popularity,
    int vote_count,
    String poster_path,
    int id,
    String backdrop_path,
    String original_language,
    String original_title,
    List<int> genre_ids,
    String title,
    double vote_average,
    String overview,
    String release_date,
  }) {
    return ChosenMovie(
      popularity: popularity ?? this.popularity,
      vote_count: vote_count ?? this.vote_count,
      poster_path: poster_path ?? this.poster_path,
      id: id ?? this.id,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      original_language: original_language ?? this.original_language,
      original_title: original_title ?? this.original_title,
      genre_ids: genre_ids ?? this.genre_ids,
      title: title ?? this.title,
      vote_average: vote_average ?? this.vote_average,
      overview: overview ?? this.overview,
      release_date: release_date ?? this.release_date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'popularity': popularity,
      'vote_count': vote_count,
      'poster_path': poster_path,
      'id': id,
      'backdrop_path': backdrop_path,
      'original_language': original_language,
      'original_title': original_title,
      'genre_ids': genre_ids,
      'title': title,
      'vote_average': vote_average,
      'overview': overview,
      'release_date': release_date,
    };
  }

  factory ChosenMovie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    double vote_average;
    if (map['vote_average'] is int) {
      int x = map['vote_average'];
      vote_average = x.toDouble();
    } else {
      vote_average = map['vote_average'];
    }

    return ChosenMovie(
      popularity: map['popularity'],
      vote_count: map['vote_count'],
      poster_path: map['poster_path'],
      id: map['id'],
      backdrop_path: map['backdrop_path'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      genre_ids: List<int>.from(map['genre_ids']),
      title: map['title'],
      vote_average: vote_average,
      overview: map['overview'],
      release_date: map['release_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChosenMovie.fromJson(String source) =>
      ChosenMovie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChosenMovie(popularity: $popularity, vote_count: $vote_count, poster_path: $poster_path, id: $id, backdrop_path: $backdrop_path, original_language: $original_language, original_title: $original_title, genre_ids: $genre_ids, title: $title, vote_average: $vote_average, overview: $overview, release_date: $release_date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChosenMovie &&
        o.popularity == popularity &&
        o.vote_count == vote_count &&
        o.poster_path == poster_path &&
        o.id == id &&
        o.backdrop_path == backdrop_path &&
        o.original_language == original_language &&
        o.original_title == original_title &&
        listEquals(o.genre_ids, genre_ids) &&
        o.title == title &&
        o.vote_average == vote_average &&
        o.overview == overview &&
        o.release_date == release_date;
  }

  @override
  int get hashCode {
    return popularity.hashCode ^
        vote_count.hashCode ^
        poster_path.hashCode ^
        id.hashCode ^
        backdrop_path.hashCode ^
        original_language.hashCode ^
        original_title.hashCode ^
        genre_ids.hashCode ^
        title.hashCode ^
        vote_average.hashCode ^
        overview.hashCode ^
        release_date.hashCode;
  }
}
