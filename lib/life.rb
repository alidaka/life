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
        unless col_i == cols-1
          s << ', '
        end
      }

      unless row_i == rows-1
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

  def fudge_row(row)
    case row
    when -1 then rows - 1
    when rows then 0
    else row
    end
  end

  def fudge_col(col)
    case col
    when -1 then cols - 1
    when cols then 0
    else col
    end
  end

  def living_neighbors(row, col)
    cells = []

    cells << @world[fudge_row(row-1)] [fudge_col(col-1)]
    cells << @world[fudge_row(row-1)] [fudge_col(col)]
    cells << @world[fudge_row(row-1)] [fudge_col(col+1)]

    cells << @world[fudge_row(row)]   [fudge_col(col-1)]
    cells << @world[fudge_row(row)]   [fudge_col(col+1)]

    cells << @world[fudge_row(row+1)] [fudge_col(col-1)]
    cells << @world[fudge_row(row+1)] [fudge_col(col)]
    cells << @world[fudge_row(row+1)] [fudge_col(col+1)]

    cells.count {|cell| cell }
  end
end
