class CreateGameSystems < ActiveRecord::Migration[7.1]
  def change
    create_table :game_systems, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
