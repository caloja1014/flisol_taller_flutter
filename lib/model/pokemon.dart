class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final int hp;
  final int experience;
  final int attack;
  final int defense;
  final int specialAttack;
  bool isFavorite ;
   Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.experience,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.hp,
    this.isFavorite = false,
  });
  set favorite(bool value) {
    isFavorite = value;
  }
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final sprites = json["sprites"];
    final other = sprites["other"];
    String imageUrl = other["dream_world"]["front_default"];
    final stats = json["stats"];
    Map<String, int> localStats = {
      "hp": 0,
      "attack": 0,
      "defense": 0,
      "special-attack": 0,
    };
    stats.forEach((element) {
      final stat = element["stat"];
      final name = stat["name"];
      final baseStat = element["base_stat"];
      if (localStats.containsKey(name)) {
        localStats[name] = baseStat;
      }
    });
    final name = json['name'][0].toUpperCase() + json['name'].substring(1);
    return Pokemon(
      id: json['id'],
      name: name,
      imageUrl: imageUrl,
      experience: json['base_experience'],
      attack: localStats["attack"]!,
      defense: localStats["defense"]!,
      specialAttack: localStats["special-attack"]!,
      hp: localStats["hp"]!,
    );
  }
  @override
  String toString() {
    return "Pokemon: $name, $imageUrl, $hp, $attack, $defense, $specialAttack, $experience";
  }
}
