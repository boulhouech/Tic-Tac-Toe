# Documentation for Tic-Tac-Toe Game Implementation

## Overview

This code implements a simple console-based Tic-Tac-Toe game for two players. The game is composed of three main classes: `Game`, `Board`, and `Player`. The players take turns to make moves on the board until one of them wins or the board is full, resulting in a draw.

## Classes

### Game

The `Game` class manages the game flow, including player turns, checking for winners, and handling player moves.

#### Attributes

- `@board`: An instance of the `Board` class representing the game board.
- `@players`: An array of player names.
- `@player_symbols`: An array of symbols ('X' or 'O') associated with the players.
- `@player_moves`: A nested array to track the moves made by each player.

#### Methods

- `initialize(board, players, player_symbols)`: Initializes a new game with the given board, players, and their respective symbols.
- `play_round`: Manages the game rounds, alternating player turns and checking for winners or a full board to end the game.
- `check_winner(moves)`: Checks if the given moves array contains a winning combination.
- `make_move(player, symbol)`: Prompts a player to make a move and updates the board and player's moves accordingly.

### Board

The `Board` class represents the Tic-Tac-Toe board and manages the display and state of the board positions.

#### Attributes

- `@board_position`: An array representing the board positions, initially set to numbers 0-8.
- `@playing_positions`: An array to keep track of positions that have been played.

#### Methods

- `initialize`: Initializes the board with default positions.
- `show_board`: Displays the current state of the board.
- `free_positions`: Returns an array of free positions on the board.
- `board_full?`: Checks if the board is full by verifying if there are no free positions left.

### Player

The `Player` class manages player information, including player names and symbols.

#### Class Variables

- `@@players`: A class-level array to store player names.
- `@@player_symbols`: A class-level array to store player symbols ('X' or 'O').

#### Constants

- `MAX_PLAYERS`: The maximum number of players allowed (2).

#### Methods

- `initialize(name)`: Initializes a new player with the given name and assigns a symbol.
- `player_on`: Announces a player joining the game and assigns a symbol if it hasn't been chosen.
- `choose_x_or_o`: Prompts the player to choose their symbol ('X' or 'O').
- `self.info`: Displays the player names and their corresponding symbols.

## Game Initialization and Execution

1. **Initialize the Board**:
    ```ruby
    board = Board.new
    ```

2. **Initialize Players**:
    ```ruby
    puts "Enter name for player 1:"
    player1_name = gets.chomp
    player1 = Player.new(player1_name)

    puts "Enter name for player 2:"
    player2_name = gets.chomp
    player2 = Player.new(player2_name)
    ```

3. **Get Player Symbols**:
    ```ruby
    player_symbols = Player.class_variable_get(:@@player_symbols)
    players = Player.class_variable_get(:@@players)
    ```

4. **Display Player Information**:
    ```ruby
    Player.info
    ```

5. **Initialize and Start the Game**:
    ```ruby
    game = Game.new(board, players, player_symbols)
    game.play_round
    ```

## Example Usage

To run the game, simply execute the script. It will prompt you to enter player names and symbols, then alternate turns between the players until a winner is determined or the board is full.

