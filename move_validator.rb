class MoveValidator
  def initialize(board)
    @board = board
  end

  # 駒が動かせる場所かどうか
  def valid_move?(move_from, move_to)
    piece = @board.board[move_from.x][move_from.y]
    target_place = @board.board[move_to.x][move_to.y]

    if piece.nil?
      puts '駒がありません'

      false
    elsif piece.player != @current_player
      puts '自分の駒を選択してください' 
      
      false
    elsif target_place&.player == @current_player
      puts '自分の駒があります' 
      
      false
    elsif !piece.possible_moves(move_from).include?([move_to.x, move_to.y])
      puts 'そこには動かせません'
    else
      true
    end
  end

  def valid_place?(move_to)
    if @board.board[move_to.x][move_to.y]
      puts '駒があります'

      false
    elsif @current_player.search_piece(move_to.piece).nil?
      puts '入力された駒を持っていません'

      false
    else
      true
    end
  end
end
