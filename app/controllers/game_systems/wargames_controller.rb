module GameSystems
  class WargamesController < ApplicationController
    include IsGameSystem

    def add_new_stat_row
      helpers.fields GameSystems::Wargame.new do |f|
        f.fields_for :unit_stat_definitions, UnitStatDefinition.new, child_index: Time.now.to_i do |ff|
          render turbo_stream: turbo_stream.append(
            "definition_list",
            partial: "unit_stat_definitions/form_row",
            locals: {form: ff}
          )
        end
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def game_system_params
      params.require(:game_systems_wargame).permit(:name, :slug, :edition, :competitive, :has_armies, :has_army_lists,
        game_config: {},
        unit_stat_definitions_attributes: [:id, :name, :label, :stat_type, :min, :max, :sort])
    end
  end
end
