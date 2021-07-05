import 'dart:convert';

class Actor {
  int id;
  Actor({
    this.id,
  });

  Actor copyWith({
    int id,
  }) {
    return Actor(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Actor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Actor(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source));

  @override
  String toString() => 'Actor(id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Actor &&
      o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
