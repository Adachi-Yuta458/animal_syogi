require './piece'

class Lion < Piece
  # Lの駒が縦横斜めに1マス動ける
  def possible_moves(x, y)
    [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y + 1],
      [x - 1, y - 1],
      [x + 1, y - 1],
      [x - 1, y + 1]
    ]
  end
end