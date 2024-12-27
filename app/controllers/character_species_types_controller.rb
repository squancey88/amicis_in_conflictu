class CharacterSpeciesTypesController < ApplicationController
  include SimpleModel
  include WithinWorld

  private

  def record_params
    params.require(:character_species_type).permit(:name, :lifespan)
  end
end
