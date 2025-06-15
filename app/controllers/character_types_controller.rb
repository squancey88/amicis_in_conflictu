class CharacterTypesController < ApplicationController
  include SimpleModel
  include WithinWorld

  private

  def set_records
    @pagy, @character_types = pagy(@world.character_types.where.not(name: "Player"))
  end

  def record_params
    params.require(:character_type).permit(:name)
  end
end
