class Player
  attr_reader :name
  attr_accessor :captured_pieces, :first_player

  def initialize(name)
    @name = name
    @captured_pieces = []
    @first_player = false
  end

  def add_captured_piece(piece)
    @captured_pieces << piece
  end

  def search_piece(symbol)
    @captured_pieces.find { |piece| piece.symbol == symbol }
  end

  def remove_piece(symbol)
    @captured_pieces.delete_if { |piece| piece.symbol == symbol }
  end
end