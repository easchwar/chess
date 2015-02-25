class Knight < SteppingPiece
  DELTAS = [[-2, 1], [-2, -1], [2, 1],
            [2, -1], [1, -2], [-1, -2],
            [1, 2], [-1, 2]]

  attr_reader :symbol

  def initialize(color, position, board)
    super(color, position, board)
    @symbol = @color == :white ? ["2658".hex].pack("U") : ["265E".hex].pack("U")
  end

  def deltas
    DELTAS
  end

  def dup
    Knight.new(@color, @position.dup, nil)
  end
end
