class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment, id: :uuid do |t|
      t.string :name
      t.string :description
      t.integer :cost
      t.boolean :attach_to_list
      t.boolean :attach_to_unit
      t.references :game_system, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
