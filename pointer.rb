class Pointer
  attr_accessor :x, :y, :symbol

  def initialize(input)
    parse(input)
  end

  def serialize
    col = ('A'.ord + @x).chr
    row = (@y + 1).to_s

    "#{col}#{row}#{@symbol}"
  end

  private

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
    @symbol = input[2]
  end
end