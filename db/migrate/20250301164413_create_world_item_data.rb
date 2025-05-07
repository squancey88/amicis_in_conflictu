class CreateWorldItemData < ActiveRecord::Migration[7.1]
  def change
    create_table :world_item_data, id: :uuid do |t|
      t.string :category
      t.string :type
      t.integer :visibility, default: 0
      t.references :relates_to, null: false, polymorphic: true, type: :uuid
      t.jsonb :data
      t.integer :order

      t.timestamps
    end
  end
end
