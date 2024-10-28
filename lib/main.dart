import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/game_bloc.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp(
        title: 'Guess the Number Game',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        // ! Экран для настройки игры
        home: const StartScreen(), 
      ),
    );
  }
}
