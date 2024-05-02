class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

class Board
  def initialize
    @grid = [[1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]]
  end

  def place_mark(mark, position)
    case position
    when 1 then self.grid[0][0] = mark
    when 2 then self.grid[0][1] = mark
    when 3 then self.grid[0][2] = mark
    when 4 then self.grid[1][0] = mark
    when 5 then self.grid[1][1] = mark
    when 6 then self.grid[1][2] = mark
    when 7 then self.grid[2][0] = mark
    when 8 then self.grid[2][1] = mark
    when 9 then self.grid[2][2] = mark
    end
  end

  def check_for_winner(mark)
    if self.grid[0][0] == mark && self.grid[0][1] == mark && self.grid[0][2] == mark
      true
    elsif self.grid[1][0] == mark && self.grid[1][1] == mark && self.grid[1][2] == mark
      true
    elsif self.grid[2][0] == mark && self.grid[2][1] == mark && self.grid[2][2] == mark
      true
    elsif self.grid[0][0] == mark && self.grid[1][0] == mark && self.grid[2][0] == mark
      true
    elsif self.grid[0][1] == mark && self.grid[1][1] == mark && self.grid[2][1] == mark
      true
    elsif self.grid[0][2] == mark && self.grid[1][2] == mark && self.grid[2][2] == mark
      true
    elsif self.grid[0][0] == mark && self.grid[1][1] == mark && self.grid[2][2] == mark
      true
    elsif self.grid[0][2] == mark && self.grid[1][1] == mark && self.grid[2][0] == mark
      true
    end
    false
  end

  def check_for_tie
    grid.flatten.all? { |mark| mark == 'X' || mark == 'O'}
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