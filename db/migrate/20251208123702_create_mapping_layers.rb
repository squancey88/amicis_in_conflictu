class CreateMappingLayers < ActiveRecord::Migration[7.1]
  def change
    create_table :mapping_layers, id: :uuid do |t|
      t.string :name
      t.references :map, null: false, foreign_key: { to_table: :mapping_maps }, type: :uuid

      t.timestamps
    end
  end
end
