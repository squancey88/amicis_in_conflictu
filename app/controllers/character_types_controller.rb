class CharacterTypesController < ApplicationController
  include SimpleModel
  include WithinWorld

  private

  def record_params
    params.require(:character_type).permit(:name)
  end
end
