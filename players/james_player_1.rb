class James1Player

  def initialize
  end

  def name
    "James Player 1"
  end

  def new_game
    [
      [5, 0, 5, :across],
      [5, 1, 4, :across],
      [5, 2, 3, :across],
      [5, 3, 3, :across],
      [5, 4, 2, :across]
    ]
  end

  def take_turn(state, ships_remaining)
    choice = [rand(10), rand(10)]
    while turns_placed.include?(choice)
      choice = [rand(10), rand(10)]
    end
    turns_placed << choice
    choice
  end

  def turns_placed
    @turns_placed ||=[]
  end

end
