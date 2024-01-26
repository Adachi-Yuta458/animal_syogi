require './piece'

class Lion < Piece
  # Lの駒が縦横斜めに1マス動ける
  def possible_moves(x, y)
    range = [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y + 1],
      [x - 1, y - 1],
      [x + 1, y - 1],
      [x - 1, y + 1]
    ]

    possible_range = range.select do |x, y|
      x.between?(0, 2) && y.between?(0, 3)
    end

    possible_range
  end
end