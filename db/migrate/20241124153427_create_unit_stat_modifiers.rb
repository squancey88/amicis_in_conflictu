class CreateUnitStatModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_stat_modifiers, id: :uuid do |t|
      t.references :game_system, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :description
      t.integer :cost
      t.boolean :active

      t.timestamps
    end
  end
end
