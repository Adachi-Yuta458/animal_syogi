require './piece'

class Giraffe < Piece
  def possible_moves(move_from)
    possible_moves = [
      [move_from.x + 1, move_from.y],
      [move_from.x - 1, move_from.y],
      [move_from.x, move_from.y + 1],
      [move_from.x, move_from.y - 1]
    ]

    moves = possible_moves.select do |x, y|
      x.between?(0, 2) && y.between?(0, 3)
    end

    moves
  end
end