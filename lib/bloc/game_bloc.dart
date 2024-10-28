import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_events.dart';
import 'game_states.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  // ! загаданное число
  int? _targetNumber; 
  int _attemptsLeft = 0;

  GameBloc() : super(GameInitial()) {
    on<InitGame>((event, emit) {
      // ! Генерируем случайное число
      _targetNumber = Random().nextInt(event.n) + 1; 
      _attemptsLeft = event.m;
      emit(GameInProgress(_attemptsLeft));
    });

    on<GuessNumber>((event, emit) {
      if (_targetNumber == null || _attemptsLeft <= 0) return;
      
      if (event.guessedNumber == _targetNumber) {
        // ! Победа
        emit(GameWon());
      } else {
        _attemptsLeft--;
        if (_attemptsLeft > 0) {
          // ! Еще попытки остались
          emit(GameInProgress(_attemptsLeft)); 
        } else {
         // ! Проигрыш
          emit(GameLost(_targetNumber!)); 
        }
      }
    });

    on<ResetGame>((event, emit) {
      _targetNumber = null;
      _attemptsLeft = 0;
      // ! Сброс игры
      emit(GameInitial()); 
    });
  }
}
