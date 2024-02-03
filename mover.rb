require './piece'
require './pointer'

class Mover
  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def move(pointer_1, pointer_2); end

  def valid_moving?(pointer_1, pointer_2); end

  private

  def get_piece(piece)
    piece.opposite(@current_player)
    @current_player.add_captured_piece(piece)
  end
end
