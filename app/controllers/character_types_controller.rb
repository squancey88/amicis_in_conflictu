class CharacterTypesController < ApplicationController
  include SimpleModel
  include WithinWorld
  include HasJsonSchema

  has_json_config :config

  private

  def set_records
    @pagy, @character_types = pagy(@world.character_types.where.not(name: "Player"))
  end

  def record_params
    params.require(:character_type).permit(:name, config: {})
  end
end
