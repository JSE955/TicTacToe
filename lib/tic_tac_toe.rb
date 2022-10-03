class Board
  attr_accessor :cells

  def initialize
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display
    puts cells[0].inspect
    puts cells[1].inspect
    puts cells[2].inspect
  end

  def update(cell, symbol)
    case cell
    when 1
      cells[0][0] = symbol
    when 2
      cells[0][1] = symbol
    when 3
      cells[0][2] = symbol
    when 4
      cells[1][0] = symbol
    when 5
      cells[1][1] = symbol
    when 6
      cells[1][2] = symbol
    when 7
      cells[2][0] = symbol
    when 8
      cells[2][1] = symbol
    when 9
      cells[2][2] = symbol
    else
      puts "Incorrect cell value entered"
    end
  end

  def victory_check
    if cells[0][0] == cells[0][1] && cells[0][1] == cells[0][2]
      true
    elsif cells[1][0] == cells[1][1] && cells[1][1] == cells[1][2]
      true
    elsif cells[2][0] == cells[2][1] && cells[2][1] == cells[2][2]
      true
    elsif cells[0][0] == cells[1][0] && cells[1][0] == cells[2][0]
      true
    elsif cells[0][1] == cells[1][1] && cells[1][1] == cells[1][2]
      true
    elsif cells[0][2] == cells[1][2] && cells[1][2] == cells[2][2]
      true
    elsif cells[0][0] == cells[1][1] && cells[1][1] == cells[2][2]
      true
    elsif cells[0][2] == cells[1][1] && cells[1][1] == cells[2][0]
      true
    else
      false
    end
  end
end

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def take_turn
    puts "#{name}, choose a cell"
    choice = gets
    choice.to_i
  end
end

class Game
  attr_accessor :board, :game_over
  attr_reader :p1, :p2

  def initialize
    puts "Enter name for Player 1 (X):"
    name = gets
    @p1 = Player.new(name, "X")
    puts "Enter name for Player 2 (O):"
    name = gets
    @p2 = Player.new(name, "O")
    @board = Board.new()
    @game_over = false
  end

  def play_round(current_player, next_player)
    board.display
    choice = current_player.take_turn
    board.update(choice, current_player.symbol)
    self.game_over = board.victory_check
    if game_over == true
      puts "#{current_player.name} wins!"
    else
      play_round(next_player, current_player)
    end
  end
end

game = Game.new
game.play_round(game.p1, game.p2)
