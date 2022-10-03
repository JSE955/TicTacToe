class Board
  def initialize
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end
end

class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

puts "Enter name for Player 1 (X):"
name = gets
p1 = Player.new(name, "X")

puts "Enter name for Player 2 (O):"
name = gets
p2 = Player.new(name, "O")

