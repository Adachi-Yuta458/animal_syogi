require './piece'
require './pointer'

class Mover
  def initialize(board, current_player)
    super(board, current_player)
  end

  def move(pointer_1, _pointer_2)
    piece = player.search_piece(pointer_1.piece)
    @board.set_piece(piece, pointer.x, pointer.y)
    player.remove_captured_piece(pointer_1.piece)
  end

  def valid_moving?(pointer_1, _pointer_2)
    if pointer_1.point
      puts '入力された場所にはすでに駒があります'

      false
    elsif @current_player.search_piece(input.piece).nil?
      puts '入力された駒を駒台に持っていません'

      false
    else
      true
    end
  end
end
