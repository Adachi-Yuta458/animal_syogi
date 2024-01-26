require './piece'
require './pointer'

class Mover
  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def move(pointer_1, pointer_2)
    if pointer_2.nil?
      @board.from_captured_to_board(pointer_1, @current_player)
    else
      @board.from_board_to_board(pointer_1, pointer_2, @current_player)
    end
  end

  def valid_moving?(pointer_1, pointer_2)
    if pointer_2.nil?
      by_captured(pointer_1)
    else
      by_board(pointer_1, pointer_2)
    end
  end

  private

  def by_board(pointer_1, pointer_2)    
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

  def by_captured(pointer_1)
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

  def immovable_range?(pointer_1, pointer_2)
    !(animal_range(pointer_1.point, pointer_1).include?([pointer_2.x, pointer_2.y]))
  end

  def animal_range(piece, pointer)
    piece.possible_moves(pointer.x, pointer.y)
  end
end
