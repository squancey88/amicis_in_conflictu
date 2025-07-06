class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.jsonb :description
      t.jsonb :history
      t.references :located_in, foreign_key: {to_table: :locations}, type: :uuid
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.references :location_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
