require './piece'

class Giraffe < Piece
  def possible_moves(x, y)
    possible_range = [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1]
    ]

    possible_range = range.select do |x, y|
      x.between?(0, 2) && y.between?(0, 3)
    end

    possible_range
  end
end