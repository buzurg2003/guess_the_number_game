import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  @override
  List<Object> get props => [];
}

// ! Начальное состояние
class GameInitial extends GameState {}

// ! Состояние для отображения оставшихся попыток и прогресса игры
class GameInProgress extends GameState {
  final int attemptsLeft;
  GameInProgress(this.attemptsLeft);
}

// ! Состояние для победы
class GameWon extends GameState {}

// ! Состояние для проигрыша
class GameLost extends GameState {
  final int correctNumber; // правильное число для отображения при проигрыше
  GameLost(this.correctNumber);
}
