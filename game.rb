require_relative 'board'
require_relative 'display'
require_relative 'mover_from_board'
require_relative 'mover_from_stand'
require_relative 'player'

# ゲームの進行を管理するクラス
class Game
  def initialize(player_1, player_2)
    @player_1 = Player.new(player_1)
    @player_2 = Player.new(player_2)
    @current_player = @player_1
    @player_1.first_player = true
    @board = Board.new(@player_1, @player_2)
    @display = Display.new(@board, @player_1, @player_2)
  end

  def play
    loop do
      @display.reflesh
      from, to = accept_input
      mover = to.nil? ? MoverFromStand.new(@board, @current_player) : MoverFromBoard.new(@board, @current_player)
      next unless mover.valid_moving?(from, to)

      mover.move(from, to)

      break if game_over?

      change_turns
    end
  end

  private

  def accept_input
    puts "#{@current_player.name}の番です"
    puts "入力してください"
    input = gets.chomp

    input.split(',').map { |i| Pointer.new(i) }
  end

  def game_over?
    if @current_player.captured_pieces.any? { |piece| piece.symbol == 'L' || piece.symbol == 'l'}
      puts "#{current_player.name}の勝ちです"

      true
    else
      false
    end
  end

  def change_turns
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
    puts "\n--------------------------\n\n"
  end
end