import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokeApi {
  static const String baseUrl = 'https://pokeapi.co/api/v2/';
  static Future<Pokemon> getPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$name'));
    final pokemon = Pokemon.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return pokemon;
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  static Future getPokemons({
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await http
        .get(Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final pokemons = json['results'];
      return pokemons;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  static Future<List<Pokemon>> getAllInfoPokemons({
    int limit = 20,
    int offset = 0,
  }) {
    return getPokemons(limit: limit, offset: offset).then((pokemons) async {
      final pokemonsWithInfo = <Pokemon>[];
      for (final pokemon in pokemons) {
        final pokemonInfo = await getPokemon(pokemon['name']);
        pokemonsWithInfo.add(pokemonInfo);
      }
      return pokemonsWithInfo;
    });
  }
}
