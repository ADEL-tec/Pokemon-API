import 'package:flutter/material.dart';
import 'package:poke_api/pokemon_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/pokemone_info_widget.dart';

class DisplayInfo extends StatefulWidget {
  const DisplayInfo(this.id, {super.key});
  final int id;

  @override
  State<DisplayInfo> createState() => _DisplayInfoState();
}

class _DisplayInfoState extends State<DisplayInfo> {
  late PokemonProvider _provider;
  void _init() {
    _provider = Provider.of(context, listen: false);
    _provider.getPokemonDetails(widget.id);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _provider.clearDetails();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informations')),
      body: Consumer<PokemonProvider>(
        builder: (ctx, provider, child) {
          if (provider.pokemonDetails != null) {
            return PokemoneInfoWidget(provider.pokemonDetails!);
          } else {
            return child!;
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
