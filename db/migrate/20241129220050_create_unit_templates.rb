class CreateUnitTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_templates, id: :uuid do |t|
      t.string :name
      t.integer :cost
      t.references :game_system, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
