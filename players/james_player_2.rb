require 'base'
class James2Player
  include Player::Base

  def name
    "James Player 2"
  end

  def make_choice(state, ships_remaining)
    last_turn_was_hit?(state) ? place_around_hit(last_turn, state) : random_choice
  end
  def place_around_hit(hit, state)
    new_hit = unknown_cells_surrounding(hit, state).first
    new_hit ? new_hit : random_choice
  end

end

