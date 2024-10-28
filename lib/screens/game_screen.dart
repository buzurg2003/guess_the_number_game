import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_events.dart';
import '../bloc/game_states.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});

  final TextEditingController guessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInProgress) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Попытайтесь угадать число'),
            ),
            body: Column(
              children: [
                Text(
                  'Осталось попыток: ${state.attemptsLeft}'
                ),
                TextField(
                  controller: guessController,
                  decoration: const InputDecoration(
                    labelText: 'Ваше число'
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    int guessedNumber = int.parse(
                      guessController.text
                    );
                    context.read<GameBloc>().add(
                      GuessNumber(guessedNumber)
                    );
                  },
                  child: const Text('Угадать'),
                ),
              ],
            ),
          );
        } else if (state is GameWon) {
          return _buildResultScreen(
            context, 
            'Вы угадали число!', 
            Colors.green
          );
        } else if (state is GameLost) {
          return _buildResultScreen(
            context, 
            'Вы проиграли! Число: ${
              state.correctNumber
            }', 
            Colors.red
          );
        }
        return Container();
      },
    );
  }

  Widget _buildResultScreen(
    BuildContext context, 
    String message, 
    Color color,
  ) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message, 
              style: const TextStyle(
                fontSize: 24, 
                color: Colors.white
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<GameBloc>().add(
                  ResetGame()
                );
                Navigator.pop(context);
              },
              child: const Text('Начать заново'),
            ),
          ],
        ),
      ),
    );
  }
}
