import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChosenSerie {
  String original_name;
  List<int> genre_ids;
  String name;
  int vote_count;
  String first_air_date;
  String backdrop_path;
  int id;
  double vote_average;
  String overview;
  String poster_path;
  
  ChosenSerie({
    this.original_name,
    this.genre_ids,
    this.name,
    this.vote_count,
    this.first_air_date,
    this.backdrop_path,
    this.id,
    this.vote_average,
    this.overview,
    this.poster_path,
  });

  

  ChosenSerie copyWith({
    String original_name,
    List<int> genre_ids,
    String name,
    int vote_count,
    String first_air_date,
    String backdrop_path,
    int id,
    double vote_average,
    String overview,
    String poster_path,
  }) {
    return ChosenSerie(
      original_name: original_name ?? this.original_name,
      genre_ids: genre_ids ?? this.genre_ids,
      name: name ?? this.name,
      vote_count: vote_count ?? this.vote_count,
      first_air_date: first_air_date ?? this.first_air_date,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      id: id ?? this.id,
      vote_average: vote_average ?? this.vote_average,
      overview: overview ?? this.overview,
      poster_path: poster_path ?? this.poster_path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'original_name': original_name,
      'genre_ids': genre_ids,
      'name': name,
      'vote_count': vote_count,
      'first_air_date': first_air_date,
      'backdrop_path': backdrop_path,
      'id': id,
      'vote_average': vote_average,
      'overview': overview,
      'poster_path': poster_path,
    };
  }

  factory ChosenSerie.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    double vote_average;
    if (map['vote_average'] is int) {
      int x = map['vote_average'];
      vote_average = x.toDouble();
    } else {
      vote_average = map['vote_average'];
    }

  
    return ChosenSerie(
      original_name: map['original_name'],
      genre_ids: List<int>.from(map['genre_ids']),
      name: map['name'],
      vote_count: map['vote_count'],
      first_air_date: map['first_air_date'],
      backdrop_path: map['backdrop_path'],
      id: map['id'],
      vote_average: vote_average,
      overview: map['overview'],
      poster_path: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChosenSerie.fromJson(String source) => ChosenSerie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChosenSerie(original_name: $original_name, genre_ids: $genre_ids, name: $name, vote_count: $vote_count, first_air_date: $first_air_date, backdrop_path: $backdrop_path, id: $id, vote_average: $vote_average, overview: $overview, poster_path: $poster_path)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ChosenSerie &&
      o.original_name == original_name &&
      listEquals(o.genre_ids, genre_ids) &&
      o.name == name &&
      o.vote_count == vote_count &&
      o.first_air_date == first_air_date &&
      o.backdrop_path == backdrop_path &&
      o.id == id &&
      o.vote_average == vote_average &&
      o.overview == overview &&
      o.poster_path == poster_path;
  }

  @override
  int get hashCode {
    return original_name.hashCode ^
      genre_ids.hashCode ^
      name.hashCode ^
      vote_count.hashCode ^
      first_air_date.hashCode ^
      backdrop_path.hashCode ^
      id.hashCode ^
      vote_average.hashCode ^
      overview.hashCode ^
      poster_path.hashCode;
  }
}
