class CreateCharacterTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :character_types, id: :uuid do |t|
      t.string :name
      t.references :world, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
