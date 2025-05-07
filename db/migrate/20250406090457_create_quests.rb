class CreateQuests < ActiveRecord::Migration[7.1]
  def change
    create_table :quests, id: :uuid do |t|
      t.string :title
      t.jsonb :blurb
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.references :created_by, foreign_key: {to_table: :users}, null: true, type: :uuid

      t.timestamps
    end
  end
end
