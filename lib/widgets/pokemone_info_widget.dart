import 'package:flutter/material.dart';

import '../models/pokemon_details.model.dart';

class PokemoneInfoWidget extends StatelessWidget {
  const PokemoneInfoWidget(this.pokemon, {super.key});

  final PokemonDetails pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                pokemon.pokemonInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            pokemon.pokemonInfo.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Divider(),
          const Text(
            '- Types:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Wrap(
            spacing: 5,
            children: pokemon.pokemonInfo.types
                .map((e) => Chip(label: Text(e)))
                .toList(),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
                text: '- Description: ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decorationStyle: TextDecorationStyle.dashed),
                children: [
                  TextSpan(
                      text: pokemon.speciesInfo.flavor.replaceAll('\n', ', '),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ))
                ]),
          ),
        ],
      ),
    );
  }
}
