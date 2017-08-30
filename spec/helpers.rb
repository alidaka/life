module Helpers
  def self.generate_world(rows = 3, columns = 3, alive = false)
    a = [Array.new(columns, alive)]
    (1...rows).each{ a << Array.new(columns, alive) }
    a
  end

  def self.empty_world(rows = 3, columns = 3)
    self.generate_world(rows, columns, false)
  end
end
