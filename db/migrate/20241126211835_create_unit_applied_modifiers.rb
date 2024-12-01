class CreateUnitAppliedModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_applied_modifiers, id: :uuid do |t|
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :unit_stat_modifier, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
