class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.boolean :winner

      t.timestamps
    end
  end
end
