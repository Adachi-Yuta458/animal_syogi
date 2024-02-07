require_relative 'piece'
require_relative 'pieces/elephant'
require_relative 'pieces/lion'
require_relative 'pieces/giraffe'
require_relative 'pieces/chick'

class Board
  attr_accessor :grid

  def initialize(player_1, player_2)
    @grid = Array.new(3) { Array.new(4) }
    setup_board(player_1, player_2)
  end

  def set_piece(piece, x, y)
    @grid[x][y] = piece
  end

  private

  def setup_board(player_1, player_2)
    set_piece(Elephant.new('e', player_2), 0, 0)
    set_piece(Lion.new('l', player_2), 1, 0)
    set_piece(Giraffe.new('g', player_2), 2, 0)
    set_piece(Chick.new('c', player_2), 1, 1)
    set_piece(Chick.new('C', player_1), 1, 2)
    set_piece(Giraffe.new('G', player_1), 0, 3)
    set_piece(Lion.new('L', player_1), 1, 3)
    set_piece(Elephant.new('E', player_1), 2, 3)
  end
end