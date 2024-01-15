require './piece'

class Chick < Piece
  def possible_moves(move_from)
    if player.first_player
      move = [move_from.x, move_from.y - 1]

      if move_from.y < 0
        puts 'これ以上駒を進めることができません'
      else
        move
      end
    else
      move = [move_from.x, move_from.y + 1]

      if move_from.y > 3
        puts 'これ以上駒を進めることができません'
      else
        move
      end
    end
  end
end