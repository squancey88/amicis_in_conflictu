class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units, id: :uuid do |t|
      t.string :name
      t.string :description
      t.integer :cost
      t.jsonb :stats
      t.jsonb :stat_modifiers
      t.boolean :active, null: false, default: true
      t.references :army_list, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
