import 'dart:convert';

class ActorInfo {
  // ignore: non_constant_identifier_names
  String profile_path;
  String name;
  int id;
  double popularity;

  ActorInfo({
    // ignore: non_constant_identifier_names
    this.profile_path,
    this.name,
    this.id,
    this.popularity,
  });

  ActorInfo copyWith({
    // ignore: non_constant_identifier_names
    String profile_path,
    String name,
    int id,
    double popularity,
  }) {
    return ActorInfo(
      profile_path: profile_path ?? this.profile_path,
      name: name ?? this.name,
      id: id ?? this.id,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profile_path': profile_path,
      'name': name,
      'id': id,
      'popularity': popularity,
    };
  }

  factory ActorInfo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    
    return ActorInfo(
      profile_path: map['profile_path'],
      name: map['name'],
      id: map['id'],
      popularity: map['popularity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorInfo.fromJson(String source) =>
      ActorInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActorInfo(profile_path: $profile_path, name: $name, id: $id, popularity: $popularity)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ActorInfo &&
        o.profile_path == profile_path &&
        o.name == name &&
        o.id == id &&
        o.popularity == popularity;
  }

  @override
  int get hashCode {
    return profile_path.hashCode ^
        name.hashCode ^
        id.hashCode ^
        popularity.hashCode;
  }
}
