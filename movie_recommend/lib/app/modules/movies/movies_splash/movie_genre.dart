import 'dart:convert';

class MovieGenre {
  int id;
  String name;
  MovieGenre({
    this.id,
    this.name,
  });

  MovieGenre copyWith({
    int id,
    String name,
  }) {
    return MovieGenre(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory MovieGenre.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MovieGenre(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieGenre.fromJson(String source) => MovieGenre.fromMap(json.decode(source));

  @override
  String toString() => 'MovieGenre(id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MovieGenre &&
      o.id == id &&
      o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
