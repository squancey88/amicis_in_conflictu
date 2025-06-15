class AddIndexToGameQuestEvent < ActiveRecord::Migration[7.1]
  def change
    add_index :game_quest_events, [:game_id, :quest_event_id], unique: true
  end
end
