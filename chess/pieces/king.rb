class King < SteppingPiece
  DELTAS = [[-1, -1], [-1, 0], [-1, 1],
             [0, -1], [0, 1],
             [1, -1], [1, 0],  [1, 1]]

  attr_reader :symbol

  def initialize(color, position, board)
    super(color, position, board)
    @symbol = @color == :white ? ["2654".hex].pack("U") : ["265A".hex].pack("U")
  end

  def deltas
    DELTAS
  end

  def dup
    King.new(@color, @position.dup, nil)
  end
end
