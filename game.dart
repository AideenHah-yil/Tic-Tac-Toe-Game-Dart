import "dart:io";
import "dart:core";

List<List<String>> board = [
    ['_', '_','_'],
    ['_', '_','_'],
    ['_', '_','_']

];

//function to display the board
void displayBoard() {
    for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[i].length; j++) {
            print(board[i][j] + ' ');
        }
        print('\n');
    }
}

// function to get user input

String getUserInput() {
    print("Enter your move (row and column, e.g , A1: )");
    String input= stdin.readLineSync().trim().toUpperCase();
    return input;
}

// validate the user input
bool isValidInput(String input) {
    if (input.length != 2) {
        return false;
    }

    String row = input.substring(0, 1);
    String col = input.substring(1);

    //a,b,c for rows and 1,2,3 for columns
    if (!(row == 'A' || row == 'B' || row == 'C'
    || col == '1' || col == '2' || col == '3')) {
        return false;
    }

    //convert column to index
    int colIndex = int.tryParse(col)! - 1;

    //convert row letter to integer index
    int rowIndex = row.codeUnitAt(0) - 'A'.codeUnitAt(0);
    
    //check if cell is empty
    if (board[rowIndex][colIndex]!= '_') {
        return false;
    }

return true;
}


// function to update game board with user's move
void updateGameState(String input,String playerSymbol) {
    String row = input.substring(0, 1);
    String col = input.substring(1);

    //convert column to index
    int colIndex = int.tryParse(col)! - 1;

    //convert row letter to integer index
    int rowIndex = row.codeUnitAt(0) - 'A'.codeUnitAt(0);

    //update the game board with user symbol
    board[rowIndex][colIndex] = playerSymbol;
}

//function to check if there is a winner

bool checkForWinner(String playerSymbol) {
  // Check rows
  for (int i = 0; i < board.length; i++) {
    if (board[i][0] == playerSymbol &&
        board[i][1] == playerSymbol &&
        board[i][2] == playerSymbol) {
      return true;
    }
  }

  // Check columns
  for (int j = 0; j < board[0].length; j++) {
    if (board[0][j] == playerSymbol &&
        board[1][j] == playerSymbol &&
        board[2][j] == playerSymbol) {
      return true;
    }
  }

  // Check diagonals
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
      // If any cell is empty, the game is not a draw
      if (board[i][j] == '_') {
        return false;
      }
    }
  }
  // If all cells are filled and there is no winner, it's a draw
  return true;
}


// Function to switch players
String switchPlayer(String currentPlayer) {
  return currentPlayer == 'X' ? 'O' : 'X';
}
