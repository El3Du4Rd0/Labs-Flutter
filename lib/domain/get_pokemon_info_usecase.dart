import '../../data/models/pokedex_model.dart';
import '../../data/repositories/pokemon_repository.dart';

abstract class GetPokemonInfoUseCase {
  Future<PokemonProfile?> execute(int numberPokemon);
}

class GetPokemonInfoUseCaseImpl implements GetPokemonInfoUseCase {
  final PokemonRepository repository;

  GetPokemonInfoUseCaseImpl({PokemonRepository? repository}) 
      : repository = repository ?? PokemonRepository();

  @override
  Future<PokemonProfile?> execute(int numberPokemon) async {
    return await repository.getPokemonProfileData(numberPokemon);
  }
}