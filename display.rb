require_relative 'board'
require_relative 'player'

class Display
  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def reflesh
    puts "後手: #{@player_2.captured_pieces&.map(&:symbol).join(' ')}"
    puts '   | A | B | C |'
    (0..3).each do |i|
      puts " #{i+1} | #{draw_piece(0, i)} | #{draw_piece(1, i)} | #{draw_piece(2, i)} |"
    end
    puts "先手: #{@player_1.captured_pieces&.map(&:symbol).join(' ')}"
  end

  private

  def draw_piece(x, y)
    @board.board[x][y] ? @board.board[x][y].symbol : ' '
  end
end