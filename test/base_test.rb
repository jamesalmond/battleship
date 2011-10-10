require "minitest/autorun"
require "battleship/board"
require './players/lib/base'

class BaseTest < MiniTest::Unit::TestCase

  class TestClass
    include Player::Base
  end
  def test_cells_surounding
    assert_equal TestClass.new.cells_surrounding([0,0]).sort, [[1,0],[0,1]].sort
    assert_equal TestClass.new.cells_surrounding([5,5]).sort, [[5,4],[5,6],[4,5],[6,5]].sort
  end

  def test_unknown_cells_surrounding
    state = [[:hit, :unknown, :unknown],[:hit, :unkown, :unknown],[:hit, :miss, :miss]]
    assert_equal [[1,0]],TestClass.new.unknown_cells_surrounding([0,0],state)
    assert_equal [[1,0],[2,1]].sort,TestClass.new.unknown_cells_surrounding([1,1],state).sort
  end
end

