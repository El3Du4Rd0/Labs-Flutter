// lib/framework/views/pokemon_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/pokedex_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonBase pokemon;
  
  const PokemonDetailScreen({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.pokemon.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (pokemon.profile?.sprites.frontDefault != null)
                Hero(
                  tag: 'pokemon-${pokemon.id}',
                  child: CachedNetworkImage(
                    imageUrl: pokemon.profile!.sprites.frontDefault,
                    height: 200,
                    width: 200,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              
              const SizedBox(height: 16),
              
              Text(pokemon.pokemon.name.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium),
              
              const SizedBox(height: 8),
              
              Text('ID: #${pokemon.id}'),
              
              // Aquí puedes agregar más información como tipos, 
              // estadísticas, movimientos, etc.
            ],
          ),
        ),
      ),
    );
  }
}