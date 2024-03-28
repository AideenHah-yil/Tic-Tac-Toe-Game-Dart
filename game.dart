import 'dart:io';

List<List<String>> board = [
  ['_', '_', '_'],
  ['_', '_', '_'],
  ['_', '_', '_']
];

// Function to display the game board
void displayBoard() {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      print(board[i][j] + ' ');
    }
    print('\n');
  }
}

// Function to get player input
String getPlayerInput() {
  print('Enter your move (row and column, e.g., A1):');
  String input = stdin.readLineSync()!.trim().toUpperCase();
  return input;
}

// Function to validate player input
bool isValidInput(String input) {
  if (input.length != 2) {
    return false;
  }

  String row = input.substring(0, 1);
  String col = input.substring(1);

  if (!(row == 'A' || row == 'B' || row == 'C') ||
      !(col == '1' || col == '2' || col == '3')) {
    return false;
  }

  int colIndex = int.tryParse(col)! - 1;
  int rowIndex = row.codeUnitAt(0) - 'A'.codeUnitAt(0);

  if (board[rowIndex][colIndex] != '_') {
    return false;
  }

  return true;
}

// Function to update the game state with player's move
void updateGameState(String input, String playerSymbol) {
  String row = input.substring(0, 1);
  String col = input.substring(1);

  int colIndex = int.tryParse(col)! - 1;
  int rowIndex = row.codeUnitAt(0) - 'A'.codeUnitAt(0);

  board[rowIndex][colIndex] = playerSymbol;
}

// Function to check if there is a winner
bool checkForWinner(String playerSymbol) {
  for (int i = 0; i < board.length; i++) {
    if (board[i][0] == playerSymbol &&
        board[i][1] == playerSymbol &&
        board[i][2] == playerSymbol) {
      return true;
    }
  }

  for (int j = 0; j < board[0].length; j++) {
    if (board[0][j] == playerSymbol &&
        board[1][j] == playerSymbol &&
        board[2][j] == playerSymbol) {
      return true;
    }
  }

  if ((board[0][0] == playerSymbol &&
          board[1][1] == playerSymbol &&
          board[2][2] == playerSymbol) ||
      (board[0][2] == playerSymbol &&
          board[1][1] == playerSymbol &&
          board[2][0] == playerSymbol)) {
    return true;
  }

  return false;
}

// Function to check if the game has ended in a draw
bool checkForDraw() {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == '_') {
        return false;
      }
    }
  }
  return true;
}

// Function to switch players
String switchPlayer(String currentPlayer) {
  return currentPlayer == 'X' ? 'O' : 'X';
}

// Function to start a new game
void startNewGame() {
  bool gameEnded = false;
  String currentPlayer = 'X';

  while (!gameEnded) {
    displayBoard();
    String input = getPlayerInput();

    if (isValidInput(input)) {
      updateGameState(input, currentPlayer);
      if (checkForWinner(currentPlayer)) {
        displayBoard();
        print('Player $currentPlayer wins!');
        gameEnded = true;
      } else if (checkForDraw()) {
        displayBoard();
        print('It\'s a draw!');
        gameEnded = true;
      } else {
        currentPlayer = switchPlayer(currentPlayer);
      }
    } else {
      print('Invalid input. Please try again.');
    }
  }
}

void main() {
  bool playAgain = true;

  while (playAgain) {
    startNewGame();

    // Ask if players want to play again
    print('Do you want to play again? (yes/no)');
    String playAgainInput = stdin.readLineSync()!.toLowerCase();
    playAgain = playAgainInput == 'yes';
  }

  print('Thanks for playing!');
}
