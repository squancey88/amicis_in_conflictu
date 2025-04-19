class LinkWorldAndGameMasterToCampaign < ActiveRecord::Migration[7.1]
  def change
    change_table(:campaigns, bulk: true) do |t|
      t.references :world, type: :uuid
      t.references :game_master, null: true, foreign_key: {to_table: :users}, type: :uuid
    end
  end
end
