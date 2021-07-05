import 'dart:convert';

class Providers {

  String logo_path;
  String provider_name;
  
  Providers({
    this.logo_path,
    this.provider_name,
  });

  Providers copyWith({
    String logo_path,
    String provider_name,
  }) {
    return Providers(
      logo_path: logo_path ?? this.logo_path,
      provider_name: provider_name ?? this.provider_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logo_path': logo_path,
      'provider_name': provider_name,
    };
  }

  factory Providers.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Providers(
      logo_path: map['logo_path'],
      provider_name: map['provider_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Providers.fromJson(String source) => Providers.fromMap(json.decode(source));

  @override
  String toString() => 'Providers(logo_path: $logo_path, provider_name: $provider_name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Providers &&
      o.logo_path == logo_path &&
      o.provider_name == provider_name;
  }

  @override
  int get hashCode => logo_path.hashCode ^ provider_name.hashCode;
}
