import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ! Событие для инициализации новой игры с заданными параметрами n и m
class InitGame extends GameEvent {
  // ! максимальное число диапазона
  final int n;

  // ! количество попыток
  final int m; 

  InitGame(this.n, this.m);
}

// ! Событие для ввода числа пользователем
class GuessNumber extends GameEvent {
  final int guessedNumber;

  GuessNumber(this.guessedNumber);
}

// ! Событие для сброса игры
class ResetGame extends GameEvent {}
