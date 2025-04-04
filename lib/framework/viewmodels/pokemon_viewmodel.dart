import 'package:flutter/foundation.dart';
import '../../data/models/pokedex_model.dart';
import '../../domain/get_pokemon_info_usecase.dart';
import '../../domain/get_pokemon_list_usecase.dart';

class PokemonListViewModel extends ChangeNotifier {
  final GetPokemonListUseCase getPokemonListUseCase;
  final GetPokemonInfoUseCase getPokemonInfoUseCase;

  List<PokemonBase> pokemonList = [];
  bool isLoading = false;

  // Constructor con inyección de dependencias
  PokemonListViewModel({
    GetPokemonListUseCase? getPokemonListUseCase,
    GetPokemonInfoUseCase? getPokemonInfoUseCase,
  })  : getPokemonListUseCase = getPokemonListUseCase ?? GetPokemonListUseCaseImpl(),
        getPokemonInfoUseCase = getPokemonInfoUseCase ?? GetPokemonInfoUseCaseImpl();

  Future<void> loadPokemonList() async {
    isLoading = true;
    notifyListeners();

    try {
      final pokedex = await getPokemonListUseCase.execute(20);

      if (pokedex != null) {
        List<PokemonBase> tempList = [];

        for (var pokemon in pokedex.results) {
          final urlParts = pokemon.url.split('/');
          final pokemonNumber = int.parse(urlParts[urlParts.length - 2]);

          final profile = await getPokemonInfoUseCase.execute(pokemonNumber);

          final pokemonBase = PokemonBase(
            id: pokemonNumber,
            pokemon: pokemon,
            profile: profile,
          );

          tempList.add(pokemonBase);
        }

        pokemonList = tempList;
      }
    } catch (e) {
      print('Error al cargar la lista de Pokémon: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
