class CreateGameQuestEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :game_quest_events, id: :uuid do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.references :quest_event, null: false, foreign_key: true, type: :uuid
      t.jsonb :data

      t.timestamps
    end
  end
end
