import 'dart:convert';

class PokemonInfo {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int width;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.width,
  });

  factory PokemonInfo.fromMap(Map<String, dynamic> map) {
    return PokemonInfo(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      imageUrl: map['sprites']['front_default'],
      types: List<String>.from(map['types'].map((e) => e['type']['name'])),
      height: map['height']?.toInt() ?? 0,
      width: map['width']?.toInt() ?? 0,
    );
  }

  factory PokemonInfo.fromJson(String source) =>
      PokemonInfo.fromMap(json.decode(source));
}
