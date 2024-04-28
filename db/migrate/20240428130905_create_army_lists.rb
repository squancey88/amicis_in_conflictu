class CreateArmyLists < ActiveRecord::Migration[7.1]
  def change
    create_table :army_lists, id: :uuid do |t|
      t.string :name
      t.jsonb :details
      t.references :army, null: false, foreign_key: true, type: :uuid
      t.integer :cost

      t.timestamps
    end
  end
end
