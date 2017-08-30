class World
  attr_reader :rows, :cols, :state

  def initialize(value)
    case value
    when Array then @state = value
    when World then @state = value.state.map{|row| row.clone}
    else
    end
  end

  def [](row, col)
    state[row][col]
  end

  def []=(row, col, val)
    state[row][col] = val
  end

  def rows
    state.length
  end

  def cols
    state[0].length
  end

  def ==(world)
    case world
    when World then world.state == state
    else false
    end
  end
end
