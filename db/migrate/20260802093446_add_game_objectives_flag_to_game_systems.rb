class AddGameObjectivesFlagToGameSystems < ActiveRecord::Migration[7.1]
  def change
    add_column :game_systems, :has_objectives, :boolean, default: false
  end
end
