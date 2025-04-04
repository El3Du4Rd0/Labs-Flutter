// lib/modelos/pokedex.dart
class Pokedex {
  final int count;
  final List<Pokemon> results;

  Pokedex({required this.count, required this.results});

  // Constructor factory para decodificar JSON
  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return Pokedex(
      count: json['count'],
      results: (json['results'] as List)
          .map((pokemonJson) => Pokemon.fromJson(pokemonJson))
          .toList(),
    );
  }
}

class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonProfile {
  final Sprite sprites;

  PokemonProfile({required this.sprites});

  factory PokemonProfile.fromJson(Map<String, dynamic> json) {
    return PokemonProfile(
      sprites: Sprite.fromJson(json['sprites']),
    );
  }
}

class Sprite {
  final String frontDefault;
  final String backDefault;

  Sprite({required this.frontDefault, required this.backDefault});

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
      frontDefault: json['front_default'],
      backDefault: json['back_default'],
    );
  }
}

class PokemonBase {
  final int id;
  final Pokemon pokemon;
  final PokemonProfile? profile; // Hacemos el perfil opcional para carga progresiva

  PokemonBase({
    required this.id,
    required this.pokemon,
    this.profile,
  });
}