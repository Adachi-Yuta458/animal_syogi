class Pointer
  attr_accessor :x, :y, :piece, :point

  def initialize(input)
    parse(input)
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