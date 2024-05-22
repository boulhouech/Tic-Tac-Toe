class Game
  def initialize(board, players, player_symbols)
    @board = board
    @players = players
    @player_symbols = player_symbols
    @player_moves = [[], []]
  end


def play_round
  while true
    make_move(@players[0], @player_symbols[0])
    @board.show_board
    break if check_winner(@player_moves[0]) || @board.board_full?

    make_move(@players[1], @player_symbols[1])
    @board.show_board
    break if check_winner(@player_moves[1]) || @board.board_full?
  end
end

def check_winner(moves)
  winning_combinations = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6] # diagonals
  ]

  winning_combinations.any? do |combination|
    combination.all? { |location| moves.include?(location) }
  end
end

def make_move(player, symbol)
  puts "#{player} please choose position"
  chosen_position = gets.chomp.to_i

  if @board.playing_positions.include?(chosen_position)
    puts 'This position is already used'
  else
    @board.playing_positions.push(chosen_position)
    @board.board_position[chosen_position] = symbol

    player_index = @players.index(player)
    @player_moves[player_index] << chosen_position
  end
end
end

class Board
  attr_accessor :board_position, :playing_positions

  def initialize
    @board_position = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @playing_positions = []
  end

  def show_board
    board =  "\n---------------------\n"
    board += " #{@board_position[0]} | #{@board_position[1]} | #{@board_position[2]} \n"
    board += "-----------\n"
    board += " #{@board_position[3]} | #{@board_position[4]} | #{@board_position[5]} \n"
    board += "-----------\n"
    board += " #{@board_position[6]} | #{@board_position[7]} | #{@board_position[8]} \n"
    board += "---------------------\n"
    print board
  end

  def free_positions
    @board_position.select { |location| location.is_a?(Integer) }
  end

  def board_full?
    free_positions.empty?
  end
end



class Player
  class Player
    @@players = []
    @@player_symbols = []

    MAX_PLAYERS = 2

    def initialize(name)
      @name = name

      if @@players.length < MAX_PLAYERS
        @@players << @name
        player_on
      else
        raise 'This game is only played by two players.'
      end
    end

  def player_on
    puts "\n#{name} has join the game"

   if @@players.length == 1
    player_symbols.push(choose_X_or_O)
   else
    if player_symbols[0] = 'X'
      player_symbols.push('O')
    else
      player_symbols.push('X')
   end
  end

  def choose_X_or_O
    move = ""

    until move = "X" || "O"
      puts "#{@name} chose your symbol :`X` or `O`"
      move = gets.chomp.upcase
      move
  end


  def self.info
    puts "The Players Are : #{@@players}"
    puts "\n#{@@players[0]} is #{@@player_symbols[0]}"
    puts "\n#{@@players[1]} is #{@@player_symbols[1]}"

  end
  protected
end
end
