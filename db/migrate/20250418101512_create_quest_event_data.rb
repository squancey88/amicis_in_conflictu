class CreateQuestEventData < ActiveRecord::Migration[7.1]
  def change
    create_table :quest_event_data, id: :uuid do |t|
      t.references :quest_event, null: false, foreign_key: true, type: :uuid
      t.string :type

      t.jsonb :data
      t.integer :order
      t.string :title

      t.timestamps
    end
  end
end
