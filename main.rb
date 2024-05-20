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
  @@player_movers = []

  MAX_PLAYERS = 3

  def initialize(name)
    @name = name

    if players.length < MAX_PLAYERS
      players << @name
      #here i should return a method that print that player has entered the game
    else
      raise "This game is only played by two players."
  end

  def player_ready
    puts "\n#{name} has join the game"

  end
end
