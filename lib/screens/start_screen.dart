import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_the_number_game/screens/game_screen.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_events.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Угадай число'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Введите максимальное число (n)'),
            TextField(
              controller: _nController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Text('Введите количество попыток (m)'),
            TextField(
              controller: _mController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final int? n = int.tryParse(_nController.text);
                  final int? m = int.tryParse(_mController.text);

                  if (n != null && m != null && n > 0 && m > 0) {
                    // ! Отправляем событие для инициализации новой игры
                    context.read<GameBloc>().add(InitGame(n, m));

                    // ! Переход к следующему экрану игры
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(),
                      ),
                    );
                  } else {
                    // ! Показываем сообщение об ошибке
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Введите корректные значения для n и m'),
                      ),
                    );
                  }
                },
                child: const Text('Начать игру'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
