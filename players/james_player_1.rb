require 'base'
class James1Player
  include Player::Base

  def name
    "James Player 1"
  end

  def make_choice(state, ships_remaining)
    random_choice
  end

end
