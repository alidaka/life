require 'life'
require 'helpers'

RSpec.describe 'A cell' do
  context '(alive)' do
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

    context 'propagates with two or three live neighbors' do
      context 'in the center of a 3x3' do
        it 'with two neighbors' do
          world = Helpers.empty_world

          life = Life.new(world)
          life.world[0][0] = true
          life.world[0][1] = true
          life.world[1][1] = true

          life.step

          expect(life.world[1][1]).to eq(true)
        end

        it 'with three neighbors' do
          world = Helpers.empty_world

          life = Life.new(world)
          life.world[0][0] = true
          life.world[0][1] = true
          life.world[0][2] = true
          life.world[1][1] = true

          life.step

          expect(life.world[1][1]).to eq(true)
        end
      end

      it 'with two neighbors' do
        world = Helpers.empty_world(10, 20)

        life = Life.new(world)
        life.world[7][12] = true
        life.world[7][13] = true
        life.world[8][12] = true

        life.step

        expect(life.world[8][12]).to eq(true)
      end
    end

    context 'dies with four or more live neighbors' do
      it 'with four neighbors' do
        world = Helpers.empty_world

        life = Life.new(world)
        life.world[0][0] = true
        life.world[0][1] = true
        life.world[0][2] = true
        life.world[1][0] = true
        life.world[1][1] = true

        life.step

        expect(life.world[1][1]).to eq(false)
      end

      it 'with eight neighbors' do
        world = Helpers.generate_world(3, 3, true)

        life = Life.new(world)

        life.step

        expect(life.world[1][1]).to eq(false)
      end
    end
  end

  context '(dead)' do
    it 'revives with exactly 3 live neighbors' do
      world = Helpers.empty_world

      life = Life.new(world)
      life.world[0][0] = true
      life.world[0][1] = true
      life.world[0][2] = true

      life.step

      expect(life.world[1][1]).to eq(true)
    end
  end
end
