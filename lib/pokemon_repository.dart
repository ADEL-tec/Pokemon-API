import 'package:http/http.dart' as http;
import 'package:poke_api/models/pokemon_info.model.dart';
import 'package:poke_api/models/pokemon_species_model.dart';

import 'models/pokemon_page_model.dart';

class PokemonRepository {
  final baseURL = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPage?> getPokemonList(int index) async {
// https://pokeapi.co/api/v2/pokemon?offset=20&limit=20
    try {
      final queryParameters = {
        "offset": (200 * index).toString(),
        "limit": '200',
      };

      final uri = Uri.https(baseURL, '/api/v2/pokemon', queryParameters);

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        return PokemonPage.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<PokemonInfo?> getPokemonInfo(int id) async {
    try {
      final uri = Uri.https(baseURL, '/api/v2/pokemon/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        return PokemonInfo.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<PokemonSpeciesInfo?> getPokemonSpeicesInfo(int id) async {
    try {
      final uri = Uri.https(baseURL, '/api/v2/pokemon-species/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        return PokemonSpeciesInfo.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
