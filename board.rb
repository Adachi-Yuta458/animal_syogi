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

  def move_piece(move_from, move_to, player)
    game_over = false

    if @board[move_to.x][move_to.y]
      game_over = get_piece(@board[move_to.x][move_to.y], player)
      set_piece(@board[move_from.x][move_from.y], move_to.x, move_to.y)
      set_piece(nil, move_from.x, move_from.y)
    else
      set_piece(@board[move_from.x][move_from.y], move_to.x, move_to.y)
      set_piece(nil, move_from.x, move_from.y)
    end

    game_over
  end

  def place_from_captured_pieces(move_to, player)
    piece = player.search_piece(move_to.piece)
    set_piece(piece, move_to.x, move_to.y)
    player.remove_piece(move_to.piece)

    false
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
    if piece.symbol == 'L' || piece.symbol == 'l'
      puts "#{player.name}の勝ちです"

      true
    else
      piece.opposite(player)
      player.add_captured_piece(piece)

      false
    end
  end
end