class CreateUnitStats < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_stats, id: :uuid do |t|
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.references :unit_stat_definition, null: false, foreign_key: true, type: :uuid
      t.integer :base_value

      t.timestamps
    end
  end
end
