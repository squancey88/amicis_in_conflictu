class CreateUnitStatDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_stat_definitions, id: :uuid do |t|
      t.references :game_system, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :label
      t.integer :stat_type, default: 0
      t.integer :min
      t.integer :max
      t.integer :sort

      t.timestamps
    end
  end
end
