import 'dart:convert';

class MoveInfo {
  String poster_path;
  String title;
  double vote_average;
  String backdrop_path;

  MoveInfo({
    this.poster_path,
    this.title,
    this.vote_average,
    this.backdrop_path,
  });

  MoveInfo copyWith({
    String poster_path,
    String title,
    double vote_average,
    String backdrop_path,
  }) {
    return MoveInfo(
      poster_path: poster_path ?? this.poster_path,
      title: title ?? this.title,
      vote_average: vote_average ?? this.vote_average,
      backdrop_path: backdrop_path ?? this.backdrop_path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'poster_path': poster_path,
      'title': title,
      'vote_average': vote_average,
      'backdrop_path': backdrop_path,
    };
  }

  factory MoveInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MoveInfo(
      poster_path: map['poster_path'],
      title: map['title'],
      vote_average: map['vote_average'],
      backdrop_path: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveInfo.fromJson(String source) =>
      MoveInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoveInfo(poster_path: $poster_path, title: $title, vote_average: $vote_average, backdrop_path: $backdrop_path)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MoveInfo &&
      o.poster_path == poster_path &&
      o.title == title &&
      o.vote_average == vote_average &&
      o.backdrop_path == backdrop_path;
  }

  @override
  int get hashCode {
    return poster_path.hashCode ^
      title.hashCode ^
      vote_average.hashCode ^
      backdrop_path.hashCode;
  }
}

/*
      "poster_path": "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
      "release_date": "1994-09-10",
      "original_title": "The Shawshank Redemption",
      "backdrop_path": "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
      "popularity": 6.741296,
      "vote_count": 5238,
      "video": false,
      "vote_average": 8.32

*/
