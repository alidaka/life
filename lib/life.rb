class Life
  attr_reader :world

  def initialize(world)
    Life.validate_dimensions(world)

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
    @world.each_with_index { |row, row_i|
      row.each_with_index { |cell, col_i|
        neighbors = living_neighbors(row_i, col_i)
        world[row_i][col_i] = cell_step(cell, neighbors)
      }
    }

    @world = world
  end

  def to_s
    s = '['
    @world.each_with_index{|row, row_i|
      unless row_i == 0
        s << ' '
      end

      row.each_with_index{|cell, col_i|
        s << cell.to_s
        unless col_i == self.cols-1
          s << ', '
        end
      }

      unless row_i == self.rows-1
        s << "\n"
      end
    }

    s << ']'
    s
  end

private
  def self.validate_dimensions(world)
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

  def cell_step(cell, neighbors)
    if cell
      (neighbors == 2 || neighbors == 3)
    else
      neighbors == 3
    end
  end

  def edge_row?(row)
    (row == 0) || (row == (self.rows - 1))
  end

  def edge_col?(col)
    (col == 0) || (col == (self.cols - 1))
  end

  def edge_cell?(row, col)
    edge_row?(row) || edge_col?(col)
  end

  def living_neighbors(row, col)
    # TODO: handle world edges
    if edge_cell?(row, col)
      return 0
    end

    cells = @world[row-1][col-1..col+1]
    cells << @world[row][col-1]
    cells << @world[row][col+1]
    cells << @world[row+1][col-1..col+1]
    cells.flatten.count {|cell| cell }
  end
end
