// Write a test case which checks the board size is 3 by 3 and is empty

// Challenge 1
// Write the winning scenario
// 1. Start with checking if a player has all cells in row
// 2. Extend the logic to Columns and diagonal

import 'dart:io';
import 'dart:math';

void main() {
  List<List<String>> board = createBoard();
  printBoard(board);
  String currentPlayer = 'X';

  while (true) {
    print('$currentPlayer\'s move');
    String userChoice = stdin.readLineSync();
    int row = getRow(userChoice);
    int column = getColumn(userChoice);
    if (!validate(row, column, board)) {
      print('Invalid Move');
      continue;
    }
    board[row][column] = currentPlayer;

    printBoard(board);

     if(checkForWin(board,currentPlayer)) {
       print(" $currentPlayer wins");
       return;
     }
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }
}

bool checkForWin(List<List<String>>board,String currentPlayer) {

  for(int i=0;i<=2;i++)
    {
      if(board[i][0] == currentPlayer && board[i][1]== currentPlayer && board[i][2]== currentPlayer)
      {
        print("Row Win");
        return true;
      }
    }
    for(int i=0;i<=2;i++)
  {
  if(board[0][i]== currentPlayer && board[1][i]== currentPlayer && board[2][i]== currentPlayer)
  {
  print("column Win");
  return true;
  }
  }
  if(board[0][0]== currentPlayer && board[1][1]==currentPlayer && board[2][2]== currentPlayer)
  {
  print("Diagonal Win");
  return true;
  }
  if(board[2][0]== currentPlayer && board[1][1]==currentPlayer && board[0][2]== currentPlayer)
  {
  print("Diagonal Win");
  return true;
  }
  return false;
}




// Challenge 2
// Write a test case to see if the board is empty and of size 3 by 3

List<List<String>> createBoard() {
  var boardSize = 3;
  return List.generate(boardSize, (_) => List.filled(boardSize, ' '));
}


bool validate(int row, int column, List<List<String>> board) {
  return board[row][column] == ' ';
}

int getColumn(String userInput) => ['A', 'B', 'C'].indexOf(userInput[0]);

int getRow(String userInput) => ['1', '2', '3'].indexOf(userInput[1]);

void printBoard(List<List<String>> board) {
  print('   A   B   C ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}
