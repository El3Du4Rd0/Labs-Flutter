import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pokemon_viewmodel.dart';
import './pokemon_detaild_screen.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  _PokemonListViewState createState() => _PokemonListViewState();

}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PokemonListViewModel>(context, listen: false)
            .loadPokemonList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Consumer<PokemonListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading && viewModel.pokemonList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: viewModel.pokemonList.length,
            itemBuilder: (context, index) {
              final pokemonBase = viewModel.pokemonList[index];

              return ListTile(
                leading: pokemonBase.profile?.sprites.frontDefault != null
                    ? CachedNetworkImage(
                        imageUrl: pokemonBase.profile!.sprites.frontDefault,
                        placeholder: (context, url) => const SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 48,
                        height: 48,
                      )
                    : Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                      ),
                title: Text(
                  pokemonBase.pokemon.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailScreen(pokemon: pokemonBase),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}