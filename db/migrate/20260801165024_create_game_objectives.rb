class CreateGameObjectives < ActiveRecord::Migration[7.1]
  def change
    create_table :game_objectives, id: :uuid do |t|
      t.string :name
      t.references :game_system, null: false, foreign_key: true, type: :uuid
      t.jsonb :description

      t.timestamps
    end
  end
end
