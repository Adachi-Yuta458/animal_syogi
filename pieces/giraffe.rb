require './piece'

class Giraffe < Piece
  def possible_moves(x, y)
    [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1]
    ]
  end
end