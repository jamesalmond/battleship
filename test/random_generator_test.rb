require "minitest/autorun"
require "battleship/board"
require './players/lib/random_generator'

class GeneratorTest < MiniTest::Unit::TestCase
  include Battleship

  def test_valid
    100.times do |i|
      config =Player::RandomGenerator.new.generate 
      board = Board.new(10, [5,4, 3,3, 2], config)
      assert board.valid?
    end
  end

end


