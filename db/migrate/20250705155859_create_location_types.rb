class CreateLocationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :location_types, id: :uuid do |t|
      t.string :name
      t.references :world, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :location_types, [:name, :world_id], unique: true
  end
end
