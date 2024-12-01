class CreateUnitTraits < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_traits, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :game_system, null: false, foreign_key: true, type: :uuid
      t.references :army, null: true, foreign_key: true, type: :uuid
      t.boolean :active

      t.timestamps
    end
  end
end
