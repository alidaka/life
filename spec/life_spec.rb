require 'life'
require 'helpers'

RSpec.describe Life do
  it 'accepts an initial state' do
    world = Helpers.empty_world
    life = Life.new(world)

    expect(life.world).to eq(world)
  end

  it 'maintains its own world state' do
    world = Helpers.empty_world
    life = Life.new(world)

    world[0][0] = true
    expect(life.world).not_to eq(world)
  end

  it 'requires a minimum 3x3 world' do
    world = Helpers.empty_world(2,3)
    expect {Life.new(world)}.to raise_error(ArgumentError)
  end

  it 'validates nxm world size consistency' do
    world = [[0,0,0], [0,0,0,0], [0,0,0]]
    expect {Life.new(world)}.to raise_error(ArgumentError)
  end
end
