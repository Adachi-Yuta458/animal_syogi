require './piece'

class Chick < Piece
  def possible_moves(x, y)
    if @player.first_player
      p y-1 < 0
      y - 1 < 0 ? [] : [[x, y - 1]]
    else
      y + 1 > 3 ? [] : [[x, y + 1]]
    end
  end
end