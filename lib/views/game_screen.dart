import 'package:baagchal/models/game_models.dart';
import 'package:baagchal/viewmodals/game_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final gameViewModel = Provider.of<GameViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Baag Chaal'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            final row = index ~/ 5;
            final col = index % 5;
            final piece = gameViewModel.game.board[row][col];

            return GestureDetector(
              onTap: () {
                gameViewModel.movePiece(row, col);
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: _getPieceWidget(piece),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getPieceWidget(Piece piece) {
    final gameViewModel = Provider.of<GameViewModel>(context);
    switch (piece) {
      case Piece.Tiger:
        return Image.asset(
          'assets/images/tiger.png',
          fit: BoxFit.cover,
        );
      case Piece.Goat:
        return Container(
          color: gameViewModel.game.goatCount < 20 ? Colors.green : Colors.red,
          child: Image.asset(
            'assets/images/goat.png',
            fit: BoxFit.cover,
          ),
        );
      case Piece.None:
      default:
        return const SizedBox.shrink();
    }
  }
}
