import 'package:flutter/material.dart';
import 'package:poke_api/widgets/list_item.dart';
import 'package:poke_api/pokemon_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();
  late PokemonProvider _provider;

  @override
  void initState() {
    _provider = Provider.of<PokemonProvider>(context, listen: false);
    _provider.fetchPokemons();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_provider.isLoading) {
        print('_______________________');
        _provider.fetchPokemons();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon list')),
      body: Consumer<PokemonProvider>(builder: (context, provider, child) {
        if (!provider.hasError) {
          if (provider.getPokemonPage != null) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GridView.builder(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount:
                          provider.getPokemonPage!.pokemonListings.length,
                      itemBuilder: (context, index) => ListItem(
                          provider.getPokemonPage!.pokemonListings[index])),
                  // if (provider.isLoading)
                  const SizedBox(
                    height: 60,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return Center(
            child: FilledButton(
                onPressed: () {
                  provider.fetchPokemons();
                },
                child: const Text("Refresh")),
          );
        }
      }),
    );
  }
}
