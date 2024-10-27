class AddCampaignToGame < ActiveRecord::Migration[7.1]
  def change
    change_table :games do |t|
      t.references :campaign, type: :uuid
    end
  end
end
