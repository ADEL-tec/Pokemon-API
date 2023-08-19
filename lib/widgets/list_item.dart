import 'package:flutter/material.dart';
import 'package:poke_api/screens/display_info.dart';

import '../models/pokemon_listing_model.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.poke, {super.key});

  final PokemonListing poke;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => DisplayInfo(poke.id)));
      },
      child: Card(
        child: Column(
          children: [
            Expanded(child: Image.network(poke.imageUrl)),
            Text(
              poke.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
