require_relative 'piece'
require_relative 'pointer'

class MoverFromBoard
  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def move(from, to)
    take_piece(piece(to)) if piece(to)
    @board.set_piece(piece(from), to.x, to.y)
    @board.set_piece(nil, from.x, from.y)
  end

  def valid_moving?(from, to)
    if piece(from).nil?
      puts '駒がありません'

      false
    elsif piece(from).player != @current_player
      puts '自分の駒を選択してください' 
      
      false
    elsif piece(to)&.player == @current_player
      puts '自分の駒があります' 
      
      false
    elsif immovable?(from, to)
      puts '駒の動かせる範囲ではありません'

      false
    else
      true
    end
  end

  private

  def piece(point)
    @board.grid[point.x][point.y]
  end

  def take_piece(piece)
    piece.opposite(@current_player)
    @current_player.add_captured_piece(piece)
  end

  def immovable?(from, to)
    !(animal_range(from).include?([to.x, to.y]))
  end

  def animal_range(point)
    piece(point).possible_moves(point.x, point.y)
  end
end
