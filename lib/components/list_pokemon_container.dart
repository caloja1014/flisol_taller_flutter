import 'package:flisol_taller_flutter/components/pokemon_container.dart';
import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/material.dart';

class ListPokemonContainer extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final Function(Pokemon) onFavoriteSelected;
  final String title;
  const ListPokemonContainer({
    super.key,
    required this.pokemonList,
    required this.onFavoriteSelected,
    this.title = "Todos",
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Expanded(
        child: SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title.isNotEmpty
              ? Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: title.isNotEmpty ? 10 : 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: pokemonList
                    .map(
                      (pokemon) => PokemonContainer(
                        pokemon: pokemon,
                        showFavorite: true,
                        onFavorite: (poke) {
                          onFavoriteSelected(poke);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
