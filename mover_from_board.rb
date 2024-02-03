require './piece'
require './pointer'

class MoverFromBoard
  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def move(pointer_1, pointer_2)
    from_piece = @board[pointer_1.x][pointer_1.y]
    to_piece = @board[pointer_2.x,][pointer_2.y]

    get_piece(to_piece) if to_piece
    @board.set_piece(from_piece, pointer_2.x, pointer_2.y)
    @board.set_piece(nil, pointer_1.x, pointer_1.y)
  end

  def valid_moving?(pointer_1, pointer_2)
    if pointer_1.point.nil?
      puts '駒がありません'

      false
    elsif pointer_1.point.player != @current_player
      puts '自分の駒を選択してください' 
      
      false
    elsif pointer_2.point&.player == @current_player
      puts '自分の駒があります' 
      
      false
    elsif immovable_range?(pointer_1, pointer_2)
      puts '駒の動かせる範囲ではありません'

      false
    else
      true
    end
  end

  private

  def get_piece(piece)
    piece.opposite(@current_player)
    @current_player.add_captured_piece(piece)
  end

  def immovable_range?(pointer_1, pointer_2)
    !(animal_range(pointer_1.point, pointer_1).include?([pointer_2.x, pointer_2.y]))
  end

  def animal_range(piece, pointer)
    piece.possible_moves(pointer.x, pointer.y)
  end
end
