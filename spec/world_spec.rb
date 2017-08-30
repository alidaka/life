require 'world'
require 'helpers'

RSpec.describe World do
  it 'can be initialized from an array' do
    world_array = Helpers.empty_world
    World.new(world_array)
  end

  it 'can be duplicated' do
    world_array = Helpers.empty_world
    world1 = World.new(world_array)
    world2 = World.new(world1)

    expect(world1).to eq(world2)
  end

  it 'is deref-able' do
    world_array = Helpers.empty_world
    world = World.new(world_array)

    expect(world[0,0]).to eq(false)
  end

  it 'is assignable' do
    world_array = Helpers.empty_world
    world = World.new(world_array)
    world[0,1] = true

    expect(world[0,1]).to eq(true)
  end

  it 'has value equality' do
    world_array = Helpers.empty_world
    world1 = World.new(world_array)
    world2 = World.new(world1)

    world1[0,0] = true
    expect(world2[0,0]).not_to eq(world1[0,0])
  end

  it 'has value inequality' do
    world_array = Helpers.empty_world
    world1 = World.new(world_array)
    world2 = World.new(world1)

    world1[0,0] = true
    world2[0,0] = true
    expect(world2[0,0]).to eq(world1[0,0])
  end
end
