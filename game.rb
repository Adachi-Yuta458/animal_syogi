require './board'
require './display'
require './player'
require './piece'
require './input'

class Game
  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1, true)
    @player_2 = Player.new(player_2, false)
    @current_player = @player_1
    @board = Board.new(@player_1, @player_2)
    @display = Display.new(@board, @player_1, @player_2)
    @move_validator = MoveValidator.new(@board)
  end

  def play
    loop do
      @display.reflesh
      puts "#{@current_player.name}の番です"
      puts "入力してください"


      input = gets.chomp
      input_1, input_2 = input.split(',')
      if input_2
        move_from = Input.parse(input_1)
        move_to = Input.parse(input_2)
        next unless move_validator.valid_move?(move_from, move_to)

        game_over = @board.move_piece(move_from, move_to, @current_player)
      else
        move_to = Input.parse(input_1)
        next unless move_validator.valid_place?(move_to)

        game_over = @board.place_from_captured_pieces(move_to, @current_player)
      end

      if game_over
        break
      else
      end

      change_turns
    end
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

  private

  def change_turns
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
    puts "\n--------------------------\n\n"
  end
end