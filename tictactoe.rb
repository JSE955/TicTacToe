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

  def print_board
    puts
    p grid[0]
    p grid[1]
    p grid[2]
    puts
  end

  def place_mark(mark, position)
    case position
    when 1 then grid[0][0] = mark
    when 2 then grid[0][1] = mark
    when 3 then grid[0][2] = mark
    when 4 then grid[1][0] = mark
    when 5 then grid[1][1] = mark
    when 6 then grid[1][2] = mark
    when 7 then grid[2][0] = mark
    when 8 then grid[2][1] = mark
    when 9 then grid[2][2] = mark
    end
  end

  def check_for_winner(mark)
    if grid[0][0] == mark && grid[0][1] == mark && grid[0][2] == mark
      return true
    elsif grid[1][0] == mark && grid[1][1] == mark && grid[1][2] == mark
      return true
    elsif grid[2][0] == mark && grid[2][1] == mark && grid[2][2] == mark
      return true
    elsif grid[0][0] == mark && grid[1][0] == mark && grid[2][0] == mark
      return true
    elsif grid[0][1] == mark && grid[1][1] == mark && grid[2][1] == mark
      return true
    elsif grid[0][2] == mark && grid[1][2] == mark && grid[2][2] == mark
      return true
    elsif grid[0][0] == mark && grid[1][1] == mark && grid[2][2] == mark
      return true
    elsif grid[0][2] == mark && grid[1][1] == mark && grid[2][0] == mark
      return true
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
    @current_player = player_one
  end

  def play
    game_board.print_board
    puts "#{current_player.name} - choose your space"
    position = gets.chomp.to_i
    self.game_board.place_mark(current_player.mark, position)
    if self.game_board.check_for_winner(current_player.mark)
      puts "#{current_player.name} wins!"
    elsif self.game_board.check_for_tie
      puts "It's a tie!"
    else
      switch_current_player
      play
    end
  end

  def switch_current_player
    self.current_player = current_player == player_one ? player_two : player_one
  end
end

puts 'Welcome to Tic-Tac-Toe!'
puts 'Player 1 (X) - Enter your name: '
player_one_name = gets.chomp
player_one = Player.new(player_one_name, 'X')
puts 'Player 2 (O) - Enter your name: '
player_two_name = gets.chomp
player_two = Player.new(player_two_name, 'O')

game = Game.new(player_one, player_two)
game.play
