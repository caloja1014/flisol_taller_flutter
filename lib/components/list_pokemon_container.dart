import 'package:flisol_taller_flutter/components/pokemon_container.dart';
import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/material.dart';

class ListPokemonContainer extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final List<Pokemon> favoritesPokemon;
  final Function(Pokemon) onFavoriteSelected;
  const ListPokemonContainer({
    super.key,
    required this.pokemonList,
    required this.favoritesPokemon,
    required this.onFavoriteSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Todos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
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
                          // setState(() {
                          //   poke.isFavorite = !poke.isFavorite;
                          //   if (poke.isFavorite) {
                          //     widget.favoritesPokemon.add(poke);
                          //     return;
                          //   }
                          //   widget.favoritesPokemon.remove(poke);
                          // });
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
    );
  }
}

// class ListPokemonContainer extends StatefulWidget {
//   final List<Pokemon> pokemonList;
//   final List<Pokemon> favoritesPokemon;
//   const ListPokemonContainer({super.key, required this.pokemonList, required this.favoritesPokemon});

//   @override
//   State<ListPokemonContainer> createState() => _ListPokemonContainerState();
// }

// class _ListPokemonContainerState extends State<ListPokemonContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Todos",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: widget.pokemonList
//                     .map(
//                       (pokemon) => PokemonContainer(
//                         pokemon: pokemon,
//                         showFavorite: true,
//                         onFavorite: (poke) {
//                           setState(() {
//                             poke.isFavorite = !poke.isFavorite;
//                             if (poke.isFavorite) {
//                               widget.favoritesPokemon.add(poke);
//                               return;
//                             }
//                             widget.favoritesPokemon.remove(poke);
//                           });
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
