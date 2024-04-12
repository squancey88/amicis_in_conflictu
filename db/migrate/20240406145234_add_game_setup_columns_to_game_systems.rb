class AddGameSetupColumnsToGameSystems < ActiveRecord::Migration[7.1]
  def change
    change_table(:game_systems, bulk: true) do |t|
      t.jsonb :game_config
      t.boolean :competitive
      t.string :edition
      t.string :slug
    end
    add_index :game_systems, :slug, unique: true
  end
end
