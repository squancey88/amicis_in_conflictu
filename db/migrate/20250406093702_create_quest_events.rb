class CreateQuestEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :quest_events, id: :uuid do |t|
      t.string :title
      t.jsonb :blurb
      t.references :quest, null: false, foreign_key: true, type: :uuid
      t.integer :order

      t.timestamps
    end
  end
end
