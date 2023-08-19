import 'dart:convert';

import 'package:poke_api/models/pokemon_species_model.dart';

import 'pokemon_info.model.dart';

class PokemonDetails {
  final PokemonInfo pokemonInfo;
  final PokemonSpeciesInfo speciesInfo;
  PokemonDetails({
    required this.pokemonInfo,
    required this.speciesInfo,
  });

  factory PokemonDetails.fromMap(Map<String, dynamic> map) {
    return PokemonDetails(
      pokemonInfo: PokemonInfo.fromMap(map['pokemonInfo']),
      speciesInfo: PokemonSpeciesInfo.fromMap(map['speciesInfo']),
    );
  }

  factory PokemonDetails.fromJson(String source) =>
      PokemonDetails.fromMap(json.decode(source));
}
