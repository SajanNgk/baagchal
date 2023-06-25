import 'package:baagchal/models/game_models.dart';
import 'package:flutter/foundation.dart';


class GameViewModel with ChangeNotifier {
  late Game _game;

  Game get game => _game;

  GameViewModel() {
    _game = Game();
  }

  void movePiece(int row, int col) {
    // Delegate the move to the game model
    _game.movePiece(row, col);
    // Update the UI after the move
    notifyListeners();
  }
}
