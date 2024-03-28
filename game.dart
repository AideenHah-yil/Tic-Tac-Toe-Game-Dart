import "dart:io";
import "dart:core";

List<List<String>> board = [
    ['_', '_','_'],
    ['_', '_','_'],
    ['_', '_','_']

];

void displayBoard() {
    for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[i].length; j++) {
            print(board[i][j]);
        }
        print('\n');
    }
}
