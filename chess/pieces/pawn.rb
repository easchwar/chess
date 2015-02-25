class Pawn < Piece
  DELTAS = { black: [[1, 0], [2, 0]],
             white: [[-1, 0], [-2, 0]]}
  ATTACKS = { black: [[1, -1], [1, 1]],
              white: [[-1, -1], [-1, 1]] }

  attr_accessor :symbol, :attacks, :moved, :deltas

  def initialize(color, position, board)
    super(color, position, board)
    @symbol = @color == :white ? ["2659".hex].pack("U") : ["265F".hex].pack("U")
    @moved = false
    @deltas = DELTAS[color]
    @attacks = ATTACKS[color]
  end

  def moves
    if @moved
      standard_moves + attack_moves
    else
      @moved = true
      first_moves + attack_moves
    end
  end

  def first_moves
    legal_moves = standard_moves
    unless legal_moves.empty?
      current_move = sum_positions(@position, @deltas.last)
      legal_moves << current_move if legal_move?(current_move)
    end
    legal_moves
  end

  def standard_moves
    legal_moves = []
    current_move = sum_positions(@position, @deltas.first)
    legal_moves << current_move if legal_move?(current_move)
    legal_moves
  end

  def attack_moves
    legal_moves = []
    @attacks.each do |attack|
      current_move = sum_positions(@position, attack)
      legal_moves << current_move if legal_attack?(current_move)
    end
    legal_moves
  end

  def legal_move?(pos)
    @board.on_board?(pos) && @board.empty?(pos)
  end

  def legal_attack?(pos)
    @board.on_board?(pos) && !@board.empty?(pos) && @board.piece_color(pos) != @color
  end
end
