import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokedex_model.dart';
import '../services/pokemon_api_service.dart';

class PokemonRepository implements PokemonApiService {
  // API URLs
  static const String baseUrl = "https://pokeapi.co/api/v2";
  static const String pokemonEndpoint = "/pokemon";

  @override
  Future<Map<String, dynamic>?> getPokemonList(int limit) async {
      // Construcción del endpoint y sus paramétros
      final url = Uri.parse('$baseUrl$pokemonEndpoint?limit=$limit');

      try {
          // Llamada del endpoint
          final response = await http.get(url);

          // Verificar el código de respuesta
          if (response.statusCode == 200) {
              // Decodificar la respuesta a json
              return json.decode(response.body);
          } else {
              print('Error fetching pokemon list: ${response.statusCode}');
              return null;
          }
      } catch (e) {
          print('Exception occurred: $e');
          return null;
      }
  }

  @override
  Future<Map<String, dynamic>?> getPokemonInfo(int numberPokemon) async {
      // Construcción de la url
      final url = Uri.parse('$baseUrl$pokemonEndpoint/$numberPokemon');

      try {
          final response = await http.get(url);

          if (response.statusCode == 200) {
              return json.decode(response.body);
          } else {
              print('Error fetching pokemon info: ${response.statusCode}');
              return null;
          }
      } catch (e) {
          print('Exception occurred: $e');
          return null;
      }
  }

  Future<Pokedex?> getPokedexData(int limit) async {
      final responseData = await getPokemonList(limit);
      if (responseData != null) {
        return Pokedex.fromJson(responseData);
      }
      return null;
  }

  Future<PokemonProfile?> getPokemonProfileData(int numberPokemon) async {
      final responseData = await getPokemonInfo(numberPokemon);
      if (responseData != null) {
        return PokemonProfile.fromJson(responseData);
      }
      return null;
  }
}

