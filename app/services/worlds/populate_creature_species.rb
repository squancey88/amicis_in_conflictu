
module Worlds
  class PopulateCreatureSpecies < ApplicationService
    attr_reader :world, :species_types

    def initialize(world:, species_types:)
      @world = world
      @species_types = species_types
    end

    def call
      species = case species_types
      when "dnd-5e"
        dnd_5e()
      end

      species.each do |type|
        world.character_species_types.create(name: type)
      end
    end

    private

    def dnd_5e
      [
        "Human",
        "Elf",
        "Half elf"
      ]
    end
  end
end
