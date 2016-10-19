require 'life'
require 'helpers'

RSpec.describe 'A cell' do
  context 'dies with fewer than two live neighbors' do
    context 'in the center of a 3x3' do
      it 'with no neighbors' do
        world = Helpers.empty_world

        life = Life.new(world)
        life.world[1][1] = true

        life.step

        expect(life.world[1][1]).to eq(false)
      end

      it 'with one neighbor' do
        world = Helpers.empty_world

        life = Life.new(world)
        life.world[1][1] = true
        life.world[0][1] = true

        life.step

        expect(life.world[1][1]).to eq(false)
      end
    end

    it 'in an inner location in a larger grid' do
      world = Helpers.empty_world(10, 20)

      life = Life.new(world)
      life.world[8][12] = true

      life.step

      expect(life.world[8][12]).to eq(false)
    end
  end
end
