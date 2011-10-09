require 'random_generator'
require 'ruby-debug'
module Player
  module Base

    def initialize
      @turns_placed = []
    end
    def new_game
      game = RandomGenerator.new.generate
      debugger
      game
    end

    def take_turn(state, ships_remaining)
      choice = make_choice(state, ships_remaining)
      turns_placed << choice
      choice
    end

    def make_choice(state, ships_remaining)
      raise "implement me!"
    end

    def turns_placed
      @turns_placed
    end

  end
end
