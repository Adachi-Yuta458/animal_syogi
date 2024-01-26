class Pointer
  attr_accessor :x, :y, :piece, :point

  def initialize(input, board)
    parse(input)
    @board = board
    @point = @board.board[@x][@y]
  end

  def parse(input)
    case input[0]
    when 'A'
      @x = 0
    when 'B'
      @x = 1
    when 'C'
      @x = 2
    end
    @y = input[1].to_i - 1
    @piece = input[2]
  end
end