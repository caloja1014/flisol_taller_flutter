import 'package:flisol_taller_flutter/components/pokemon_container.dart';
import 'package:flisol_taller_flutter/components/search_bar.dart';
import 'package:flisol_taller_flutter/model/pokemon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Map<int, Color> color = {
    50: Color.fromRGBO(54, 93, 160, .1),
    100: Color.fromRGBO(54, 93, 160, .2),
    200: Color.fromRGBO(54, 93, 160, .3),
    300: Color.fromRGBO(54, 93, 160, .4),
    400: Color.fromRGBO(54, 93, 160, .5),
    500: Color.fromRGBO(54, 93, 160, .6),
    600: Color.fromRGBO(54, 93, 160, .7),
    700: Color.fromRGBO(54, 93, 160, .8),
    800: Color.fromRGBO(54, 93, 160, .9),
    900: Color.fromRGBO(54, 93, 160, 1),
  };
  static const blueColor = Color(0xFF365DA0);
  static const yellowColor = Color(0xFFFAC917);
  @override
  Widget build(BuildContext context) {
    const colorCustom = MaterialColor(
      0xFF365DA0,
      color,
    );

    return MaterialApp(
      title: 'Pokemon library',
      theme: ThemeData(
        primarySwatch: colorCustom,
        primaryColor: blueColor,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: blueColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: blueColor,
          selectedLabelStyle: TextStyle(
            color: yellowColor,
            fontFamily: "Pokemon",
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "Pokemon",
          ),
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white,
        ),
        focusColor: yellowColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontFamily: "Pokemon",
            color: yellowColor,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: blueColor,
          foregroundColor: yellowColor,
        ),
      ),
      home: const MyHomePage(title: 'Pokemon library'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  static final mockPokemon = Pokemon(
      id: 1,
      name: 'Bulbasaur',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      attack: 10,
      defense: 10,
      experience: 10,
      specialAttack: 10,
      hp: 10);

  final favoritesPokemon = <Pokemon>[
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon
  ];
  final allPokemon = <Pokemon>[
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon,
    _MyHomePageState.mockPokemon
  ];
  @override
  Widget build(BuildContext context) {
    const double iconTabSize = 30;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SearchBarCustom(
                controller: _searchController,
                onSearch: (text) {
                  if (kDebugMode) {
                    print(text);
                  }
                },
              ),
              SizedBox(
                height: favoritesPokemon.isNotEmpty ? 20 : 0,
              ),
              favoritesPokemon.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
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
                          children: allPokemon
                              .map(
                                (pokemon) => PokemonContainer(
                                  pokemon: pokemon,
                                  showFavorite: true,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'icons/pokedex.png',
                width: iconTabSize,
                height: iconTabSize,
              ),
            ),
            label: 'Pokedex',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'icons/pokeball.png',
                width: iconTabSize,
                height: iconTabSize,
              ),
            ),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
