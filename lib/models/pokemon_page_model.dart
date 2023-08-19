import 'dart:convert';

import 'package:poke_api/models/pokemon_listing_model.dart';

class PokemonPage {
  List<PokemonListing> pokemonListings;
  bool canLoadNextPage;
  PokemonPage({
    required this.pokemonListings,
    required this.canLoadNextPage,
  });

  factory PokemonPage.fromMap(Map<String, dynamic> map) {
    return PokemonPage(
      pokemonListings: List<PokemonListing>.from(
        map['results'].map((x) => PokemonListing.fromMap(x)),
      ),
      canLoadNextPage: map['next'] != null,
    );
  }

  factory PokemonPage.fromJson(String source) =>
      PokemonPage.fromMap(json.decode(source));

  void concatPage(PokemonPage newPage) {
    canLoadNextPage = newPage.canLoadNextPage;
    pokemonListings.addAll(newPage.pokemonListings);
  }
}
