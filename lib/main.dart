import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'framework/navigation/app_router.dart';
import './framework/viewmodels/login_viewmodel.dart';
import './framework/viewmodels/pokemon_viewmodel.dart';
import './framework/viewmodels/profile_viewmodel.dart';

void main() {
  runApp(
      const PokedexApp()); // runApp corre la instancia de nuestra aplicación principal
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key}); // super(key: key) → Pasa la clave (key) al constructor de StatelessWidget (opcional, útil en listas para identificar widgets únicos).

  @override
  Widget build(BuildContext context) {
    // Recibe un BuildContext, que contiene información sobre el árbol de widgets.
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PokemonListViewModel()),
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ],
        child: MaterialApp(
          // Define nuestro entorno visual
          title:
              'Pokedex', // Define el título de la aplicación, que aparece en la barra de tareas en algunas plataformas.
          theme: ThemeData(
            // Define el tema de la aplicación con la clase ThemeData.
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors
                    .red), // Genera una paleta de colores a partir de un color base (Colors.red).
            useMaterial3: true,
          ),
          home: Router(
            routerDelegate: AppRouter(),
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ));
  }
}