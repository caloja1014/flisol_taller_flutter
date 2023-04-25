import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonContainer extends StatefulWidget {
  Pokemon? pokemon;
  final bool showFavorite;
  final Function(Pokemon)? onFavorite;
  PokemonContainer({
    super.key,
    this.pokemon,
    this.showFavorite = true,
    this.onFavorite,
  });

  @override
  State<PokemonContainer> createState() => _PokemonContainerState();
}

class _PokemonContainerState extends State<PokemonContainer> {
  @override
  Widget build(BuildContext context) {
    const width = 100.0;
    const height = 150.0;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: height * 0.4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: -5,
            right: -5,
            child: IconButton(
              iconSize: 20,
              padding: const EdgeInsets.all(0),
              onPressed: () {
                if (widget.onFavorite != null) {
                  widget.onFavorite!(widget.pokemon!);
                }
              },
              icon: Icon(
                widget.pokemon!.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Theme.of(context).focusColor,
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                const SizedBox(
                  height: height * 0.2,
                ),
                Container(
                  width: width * 0.6,
                  height: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.network(
                    widget.pokemon!.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.pokemon!.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${widget.pokemon!.experience.toString()} Exp",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
