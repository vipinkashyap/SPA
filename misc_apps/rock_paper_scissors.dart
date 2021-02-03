import 'dart:io';

import 'dart:math';

//Making an enum for all possible moves
//When there is a static list of choices. it is suggested to make an enum to access them
enum Move { rock, paper, scissors }
void main() {
  //We will make a bot to play against us.
  //We will need a random choice maker
  var randomNumberGenerator = Random();

  //We want the game to keep going
  while (true) {
    //When compared to a print
    //stdout write gives a cursor at the end of the same line
    stdout.write('Rock, paper or scissors? (r/p/s) ');
    //We need to ask user for input
    var input = stdin.readLineSync();
    //Checks for input
    if (input == 'r' || input == 'p' || input == 's') {
      //Store user input
      var playerMove;
      //Mapping to the enum
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      //The bot can play here
      var randomNumber = randomNumberGenerator.nextInt(3);
      final botMove = Move.values[randomNumber]; //enum.values returns a list
      print('You played: $playerMove');
      print('Bot played: $botMove');
      if (playerMove == botMove) {
        print("It's a Draw!");
      } else if (playerMove == Move.rock && botMove == Move.scissors ||
          playerMove == Move.paper && botMove == Move.rock ||
          playerMove == Move.scissors && botMove == Move.paper) {
        print('You Win!!');
      } else {
        print('You Lose :(');
      }
    } else if (input == 'q') {
      stdout.write('Exiting...');
      break;
    }

    // Prints on pressing Return Key on the Keyboard
    print(input);
  }
}
