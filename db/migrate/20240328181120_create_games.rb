class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games, id: :uuid do |t|
      t.references :gaming_group, null: false, foreign_key: true, type: :uuid
      t.references :game_system, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
