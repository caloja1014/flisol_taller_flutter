import 'package:flisol_taller_flutter/components/favorite_container.dart';
import 'package:flisol_taller_flutter/components/list_pokemon_container.dart';
import 'package:flisol_taller_flutter/components/search_bar.dart';
import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  final bool isLoading;
  final List<Pokemon> favoritesPokemon;
  final List<Pokemon> searchList;
  final List<Pokemon> allPokemon;
  final Function(Pokemon) onFavoriteSelected;
  const Pokedex({
    super.key,
    required this.isLoading,
    required this.allPokemon,
    required this.favoritesPokemon,
    required this.searchList,
    required this.onFavoriteSelected,
  });

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SearchBarCustom(
          isDisabled: widget.isLoading,
          controller: _searchController,
          onSearch: (text) {
            final searchedPokemon = widget.allPokemon
                .where((pokemon) => pokemon.name.contains(text));
            setState(() {
              widget.searchList.clear();
              widget.searchList.addAll(searchedPokemon);
            });
            if (kDebugMode) {
              print(text);
            }
          },
          onClear: () {
            setState(() {
              widget.searchList.clear();
            });
          },
        ),
        SizedBox(
          height: widget.favoritesPokemon.isNotEmpty ? 20 : 0,
        ),
        widget.favoritesPokemon.isNotEmpty
            ? FavoriteContainer(favoritesPokemon: widget.favoritesPokemon)
            : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
        widget.isLoading
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListPokemonContainer(
                pokemonList: widget.allPokemon,
                onFavoriteSelected: widget.onFavoriteSelected,
              ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
