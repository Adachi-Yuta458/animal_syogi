require './piece'

class Elephant < Piece
  def possible_moves(x, y)
    [
      [x + 1, y + 1],
      [x - 1, y - 1],
      [x + 1, y - 1],
      [x - 1, y + 1]
    ]
  end
end