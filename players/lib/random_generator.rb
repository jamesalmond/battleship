module Player
  class RandomGenerator

    class Ship
      attr_accessor :length, :orientation, :x, :y
      def initialize(length)
        @length = length
      end
      def to_ary
        [x,y,length, orientation]
      end
      def cells
        if orientation == :across
          (x..(9-length)).map{|x2|[x2, y]}
        else
          (y..(9-length)).map{|y2|[x, y2]}
        end
      end
    end

    def initialize
      @ships = [5,4,3,3,2].map{|s|Ship.new(s)}
      @cells = []
      @placements = []
    end

    def generate
      @ships.map{|ship| place(ship)}
    end

    def place(ship)
      ship.orientation = [:across, :down].sample
      if ship.orientation == :across
        ship.y = rand(10)
        ship.x = rand(10-(ship.length-1))
      else
        ship.x = rand(10)
        ship.y = rand(10-(ship.length-1))
      end
      clashes?(ship) ? place(ship) : finalise(ship)
    end

    def finalise(ship)
      ship.cells.each{|c| @placements << c}
      ship.to_ary
    end

    def clashes?(ship)
      ship.cells.any?{|c| @placements.include? c}
    end

  end
end
