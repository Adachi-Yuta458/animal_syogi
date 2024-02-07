require_relative 'piece'
require_relative 'pointer'

class MoverFromStand
  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def move(to, _)
    to_piece = @current_player.search_piece(to.symbol)
    @board.set_piece(piece(to), to.x, to.y)
    @current_player.remove_piece(to.symbol)
  end

  def valid_moving?(to, _)
    if @board.grid[to.x][to.y]
      puts '入力された場所にはすでに駒があります'

      false
    elsif @current_player.search_piece(to.symbol).nil?
      puts '入力された駒を駒台に持っていません'

      false
    else
      true
    end
  end

  private

  def piece(point)
    @board.grid[point.x][point.y]
  end
end
