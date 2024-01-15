class Piece
  attr_reader :symbol, :player

  def initialize(symbol, player)
    @symbol = symbol
    @player = player
  end

  def opposite(player)
    @symbol = @symbol.downcase ? @symbol.upcase : @symbol.downcase
    @player = player
  end

  def possible_moves(move_from)
    raise NotImplementedError
  end
end