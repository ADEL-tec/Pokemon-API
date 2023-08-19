import 'dart:convert';

class PokemonSpeciesInfo {
  final String flavor;
  PokemonSpeciesInfo({
    required this.flavor,
  });

  factory PokemonSpeciesInfo.fromMap(Map<String, dynamic> map) {
    return PokemonSpeciesInfo(
      flavor: map['flavor_text_entries'][0]['flavor_text'] ?? '',
    );
  }

  factory PokemonSpeciesInfo.fromJson(String source) =>
      PokemonSpeciesInfo.fromMap(json.decode(source));
}
