import 'package:flutter/foundation.dart';

enum Piece { Tiger, Goat, None }

class Game {
  List<List<Piece>> board;
  Piece currentPlayer;
  int tigerCount;
  int goatCount;

  Game()
      : board = List.generate(5, (_) => List.filled(5, Piece.None)),
        currentPlayer = Piece.Goat,
        tigerCount = 4,
        goatCount = 20;

  void movePiece(int row, int col) {
    if (board[row][col] != Piece.None) {
      // The selected cell is not empty, cannot move here
      return;
    }

    final selectedPiece = currentPlayer;

    // Logic for Tiger's move
    if (selectedPiece == Piece.Tiger) {
      // Tigers can only move to adjacent empty cells
      if (_isAdjacentCellEmpty(row, col)) {
        _movePieceToCell(row, col);
      }
    }
    // Logic for Goat's move
    else if (selectedPiece == Piece.Goat) {
      // Goats can only move to empty cells
      _movePieceToCell(row, col);
    }

    // Toggle current player
    currentPlayer = currentPlayer == Piece.Tiger ? Piece.Goat : Piece.Tiger;
  }

  bool _isAdjacentCellEmpty(int row, int col) {
    final adjacentCells = [
      [row - 1, col],
      [row + 1, col],
      [row, col - 1],
      [row, col + 1],
    ];

    for (final cell in adjacentCells) {
      final adjacentRow = cell[0];
      final adjacentCol = cell[1];
      if (_isValidCell(adjacentRow, adjacentCol) &&
          board[adjacentRow][adjacentCol] == Piece.None) {
        return true;
      }
    }

    return false;
  }

  bool _isValidCell(int row, int col) {
    return row >= 0 &&
        row < board.length &&
        col >= 0 &&
        col < board[row].length;
  }

  void _movePieceToCell(int row, int col) {
    if (currentPlayer == Piece.Tiger) {
      board[row][col] = currentPlayer;
      tigerCount--;
    } else if (currentPlayer == Piece.Goat) {
      if (goatCount > 0) {
        board[row][col] = currentPlayer;
        goatCount--;
      }
    }
  }
}
