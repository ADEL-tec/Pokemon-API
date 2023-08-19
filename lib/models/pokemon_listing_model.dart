import 'dart:convert';

class PokemonListing {
  final int id;
  final String name;
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  PokemonListing({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    return result;
  }

  factory PokemonListing.fromMap(Map<String, dynamic> map) {
    return PokemonListing(
      id: int.parse((map['url'] as String).split('/')[6]),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListing.fromJson(String source) =>
      PokemonListing.fromMap(json.decode(source));
}
