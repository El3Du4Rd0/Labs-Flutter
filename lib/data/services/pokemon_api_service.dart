// lib/services/pokemon_api_service.dart

abstract class PokemonApiService {
  // https://pokeapi.co/api/v2/pokemon/?limit=1279
  Future<Map<String, dynamic>?> getPokemonList(int limit);
  
  // https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
  Future<Map<String, dynamic>?> getPokemonInfo(int numberPokemon);
}