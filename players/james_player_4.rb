require 'base'
class James4Player
  include Player::Base

  def name
    "James Player 4"
  end

  def make_choice(state, ships_remaining)
    hit = hits.find{|h| !unknown_cells_surrounding(h, state).empty?}
    hit ?  place_around_hit(hit, state) : random_choice
  end
end

