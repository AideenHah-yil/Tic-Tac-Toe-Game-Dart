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