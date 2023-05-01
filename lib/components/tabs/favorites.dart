import 'package:flisol_taller_flutter/components/list_pokemon_container.dart';
import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  final List<Pokemon> favoritesPokemon;
  final Function(Pokemon) onFavoriteSelected;
  const Favorites({
    super.key,
    required this.favoritesPokemon,
    required this.onFavoriteSelected,
  });

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListPokemonContainer(
          pokemonList: widget.favoritesPokemon,
          onFavoriteSelected: widget.onFavoriteSelected,
          title: "",
        )
      ],
    );
  }
}
