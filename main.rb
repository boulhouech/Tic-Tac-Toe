Class Board
@@board = array.new(9,"-")
def self.display_board
  puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
  puts "----------"
  puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
  puts "----------"
  puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
end

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
  end
  move

  def self.info
    puts "The Players Are : #{@@players}"
    puts "\n#{@@players[0]} is #{@@player_symbols[0]}"
    puts "\n#{@@players[1]} is #{@@player_symbols[1]}"

  end
  protected
end
