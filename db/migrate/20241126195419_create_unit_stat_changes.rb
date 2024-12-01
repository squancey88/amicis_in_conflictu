class CreateUnitStatChanges < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_stat_changes, id: :uuid do |t|
      t.references :unit_stat_definition, null: false, foreign_key: true, type: :uuid
      t.references :unit_stat_modifier, null: false, foreign_key: true, type: :uuid
      t.integer :stat_change

      t.timestamps
    end
  end
end
