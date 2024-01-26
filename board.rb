require_relative 'piece'
require './pieces/elephant'
require './pieces/giraffe'
require './pieces/lion'
require './pieces/chick'


class Board
  attr_accessor :board

  def initialize(player_1, player_2)
    @board = Array.new(3) { Array.new(4) }
    setup_board(player_1, player_2)
  end

  def from_board_to_board(pointer_1, pointer_2, player)
    from_piece = @board[pointer_1.x][pointer_1.y]
    to_piece = @board[pointer_2.x,][pointer_2.y]

    get_piece(to_piece, player) if to_piece
    set_piece(from_piece, pointer_2.x, pointer_2.y)
    set_piece(nil, pointer_1.x, pointer_1.y)
  end

  def from_captured_to_board(pointer, player)
    piece = player.search_piece(pointer.piece)
    set_piece(piece, pointer.x, pointer.y)
    player.remove_captured_piece(pointer.piece)
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

  def set_piece(piece, x, y)
    @board[x][y] = piece
  end

  def get_piece(piece, player)
    piece.opposite(player)
    player.add_captured_piece(piece)
  end
end