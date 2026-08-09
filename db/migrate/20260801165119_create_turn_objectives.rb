class CreateTurnObjectives < ActiveRecord::Migration[7.1]
  def change
    create_table :turn_objectives, id: :uuid do |t|
      t.references :game_objective, null: false, foreign_key: true, type: :uuid
      t.references :player, null: false, foreign_key: true, type: :uuid
      t.integer :turn
      t.integer :points_scored

      t.timestamps
    end

    add_index :turn_objectives, [:game_objective_id, :player_id, :turn], unique: true
  end
end
