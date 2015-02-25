class King < SteppingPiece
  DELTAS = [[-1, -1], [-1, 0], [-1, 1],
             [0, -1], [0, 1],
             [1, -1], [1, 0],  [1, 1]]

  attr_reader :symbol

  def initialize(color, position, board)
    super
    @symbol = piece_colorize(["265A".hex].pack("U"))
  end

  private

  def deltas
    DELTAS
  end
end
