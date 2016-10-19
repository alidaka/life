module Helpers
  def self.generate_world(rows = 3, columns = 3, alive = false)
    Array.new(rows, Array.new(columns, alive))
  end

  def self.empty_world(rows = 3, columns = 3)
    self.generate_world(rows, columns, false)
  end
end
