class Input
  attr_accessor :x, :y, :piece

  def initialize(x, y, piece)
    @x = x
    @y = y
    @piece = piece
  end

  def self.parse(input)
    case input[0]
    when 'A'
      x = 0
    when 'B'
      x = 1
    when 'C'
      x = 2
    end
    y = input[1].to_i - 1

    Input.new(x, y, input[2])
  end
end