require './piece'

class Lion < Piece
  # Lの駒が縦横斜めに1マス動ける
  def possible_moves(move_from)
    possible_moves = [
      [move_from.x + 1, move_from.y],
      [move_from.x - 1, move_from.y],
      [move_from.x, move_from.y + 1],
      [move_from.x, move_from.y - 1],
      [move_from.x + 1, move_from.y + 1],
      [move_from.x - 1, move_from.y - 1],
      [move_from.x + 1, move_from.y - 1],
      [move_from.x - 1, move_from.y + 1]
    ]

    moves = possible_moves.select do |x, y|
      x.between?(0, 2) && y.between?(0, 3)
    end

    moves
  end
end