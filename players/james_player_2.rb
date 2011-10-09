require 'base'
class James2Player
  include Player::Base

  def name
    "James Player 2"
  end

  def make_choice(state, ships_remaining)
    choice = [rand(10), rand(10)]
    while turns_placed.include?(choice)
      choice = [rand(10), rand(10)]
    end
    choice
  end

end

