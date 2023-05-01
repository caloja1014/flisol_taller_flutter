import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flisol_taller_flutter/components/pokemon_container.dart';
import 'package:flutter/material.dart';

class FavoriteContainer extends StatelessWidget {
  final List<Pokemon> favoritesPokemon;
  const FavoriteContainer({super.key,  required this.favoritesPokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Favoritos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: favoritesPokemon
                .map(
                  (pokemon) => Row(
                    children: [
                      PokemonContainer(
                        pokemon: pokemon,
                        showFavorite: false,
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
