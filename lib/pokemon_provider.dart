import 'package:flutter/material.dart';
import 'package:poke_api/models/pokemon_details.model.dart';
import 'package:poke_api/models/pokemon_info.model.dart';
import 'package:poke_api/models/pokemon_page_model.dart';
import 'package:poke_api/models/pokemon_species_model.dart';
import 'package:poke_api/pokemon_repository.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonPage? _pokemonPages;
  int pageIndex = 0;
  bool hasError = false;
  bool isLoading = true;
  final _pokemonRepo = PokemonRepository();
  PokemonDetails? pokemonDetails;

  PokemonPage? get getPokemonPage {
    return _pokemonPages;
  }

  Future<bool> fetchPokemons() async {
    if (_pokemonPages == null || _pokemonPages!.canLoadNextPage) {
      if (!isLoading) {
        isLoading = true;
        notifyListeners();
      }

      return await _pokemonRepo.getPokemonList(pageIndex++).then((newPage) {
        if (newPage != null) {
          hasError = false;
          isLoading = false;
          if (_pokemonPages == null) {
            _pokemonPages = newPage;
          } else {
            _pokemonPages!.concatPage(newPage);
          }
        } else {
          hasError = true;
          isLoading = false;
        }
        notifyListeners();
        return true;
      });
    } else {
      return false;
    }
  }

  Future<void> getPokemonDetails(int pokemonId) async {
    final response = await Future.wait([
      _pokemonRepo.getPokemonSpeicesInfo(pokemonId),
      _pokemonRepo.getPokemonInfo(pokemonId),
    ]);

    final speciesInfo = response[0] as PokemonSpeciesInfo;
    final pokemonInfo = response[1] as PokemonInfo;

    pokemonDetails =
        PokemonDetails(pokemonInfo: pokemonInfo, speciesInfo: speciesInfo);
    notifyListeners();
  }

  void clearDetails() {
    pokemonDetails = null;
  }
}
