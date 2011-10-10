require File.expand_path('../random_generator.rb', __FILE__)
module Player
  module Base

    def initialize
      @turns_placed = []
    end
    def new_game
      game = RandomGenerator.new.generate
      game
    end

    def take_turn(state, ships_remaining)
      choice = make_choice(state, ships_remaining)
      turns_placed << choice
      choice
    end

    def random_choice
      choice = [rand(10), rand(10)]
      while turns_placed.include?(choice)
        choice = [rand(10), rand(10)]
      end
      choice
    end

    def make_choice(state, ships_remaining)
      raise "implement me!"
    end

    def turns_placed
      @turns_placed
    end

    def last_turn
      turns_placed[-1]
    end

    def cells_surrounding(cell)
      cells = []
      cells << [cell[0]-1,cell[1]] unless cell[0] == 0
      cells << [cell[0]+1,cell[1]] unless cell[0] == 9
      cells << [cell[0],cell[1]-1] unless cell[1] == 0
      cells << [cell[0],cell[1]+1] unless cell[1] == 9
      cells
    end

    def unknown_cells_surrounding(cell, state)
      cells_surrounding(cell).select{|surrounding| state[surrounding[1]][surrounding[0]] == :unknown}
    end

  end
end
