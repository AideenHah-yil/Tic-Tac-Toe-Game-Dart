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
