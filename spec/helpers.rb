module Helpers
  def self.empty_world(rows = 3, columns = 3)
    Array.new(rows, Array.new(columns, false))
  end
end
