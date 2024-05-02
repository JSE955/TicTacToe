class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

class Board
  def initialize
    @grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  private

  attr_reader :grid
end

class Game
  attr_accessor :player_one, :player_two, :current_player, :game_board, :winner

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @game_board = Board.new
  end
end

puts 'Welcome to Tic-Tac-Toe!'
puts 'Player 1 (X) - Enter your name: '
player_one_name = gets.chomp
player_one = Player.new(player_one_name, 'X')

puts 'Player 2 (O) - Enter your name: '
player_two_name = gets.chomp
player_two = Player.new(player_two_name, 'O')
