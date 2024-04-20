class AddFinishedFlagAndStateToGame < ActiveRecord::Migration[7.1]
  def change
    change_table(:games, bulk: true) do |t|
      t.integer :game_state, default: 0
      t.string :finish_reason
    end
  end
end
