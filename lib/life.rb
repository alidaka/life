class Life
  attr_reader :world

  def initialize(world)
    Life.validate_world(world)

    @world = Life.duplicate_world(world)
  end

  def rows
    world.length
  end

  def cols
    world[0].length
  end

  def step
    world = Life.duplicate_world(@world)

    # for each cell
    neighbors = living_neighbors(1,1)
    @world[1][1] = false
  end

private
  def self.validate_world(world)
    unless world.length >= 3 && world[0].length >= 3
      raise(ArgumentError, "world must be minimum 3x3")
    end

    unless world.all? {|row| row.length == world[0].length}
      raise(ArgumentError, "world must be minimum 3x3")
    end
  end

  def self.duplicate_world(world)
    world.map{|row| Array.new(row)}
  end

  def living_neighbors(row, column)
    cells = @world[row-1][column-1..column+1]
    cells << @world[row][column-1]
    cells << @world[row][column+1]
    cells << @world[row+1][column-1..column+1]
    cells.count {|cell| cell }
  end
end
