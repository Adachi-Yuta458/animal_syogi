require './piece'

class Chick < Piece
  def possible_moves(x, y)
    if @player.first_player
      [[x, y - 1]]
    else
      [[x, y + 1]]
    end
  end
end