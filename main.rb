class Game
  def play_round
    while true
      make_move(players[0], player_symbols[0])
      show_board
      ##      break if check_winner(@@player_moves[0])


      make_move(players[1], player_symbols[1])
      show_board
      ##       break if check_winner(@@player_moves[1])

    end

  end



  def make_move(player, move)
    puts "#{player} please choose position"
    chosen_position = gets.chomp.to_i
    if playing_positions.include?(chosen_position)
      puts "This positon is already used"
    else
      playing_positions.push(chosen_position)
    end

  end
end


class Board
  def initialize
    super
    @board_position = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @playing_positions = [] ## evrey time user choose position the index have to be pushd to this this array

  end

  def show_board
    board =  "\n---------------------\n"
    board += "#{@position[0]} | #{@position[1]} | #{@position[2]}\n"
    board += "---+---+---\n"
    board += "#{@position[3]} | #{@position[4]} | #{@position[5]}\n"
    board += "---+---+---\n"
    board += "#{@position[6]} | #{@position[7]} | #{@position[8]}\n"
    board += "---------------------\n"
    print board
  end
end

def free_positons
  @board_position.select do |position|
    @board[position].nil?
  end
end

def board_full?
  free_positons.emty?
end

class Player
  @@players = []
  @@player_symbols = []

  MAX_PLAYERS = 3

  def initialize(name)
    @name = name

    if @@players.length < MAX_PLAYERS
      @@players << @name
      player_on
    else
      raise "This game is only played by two players."
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
