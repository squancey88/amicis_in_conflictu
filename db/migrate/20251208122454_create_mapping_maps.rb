class CreateMappingMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :mapping_maps, id: :uuid do |t|
      t.string :name
      t.references :world, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
