class AddCampaignAndUserAndGameSystemToArmyList < ActiveRecord::Migration[7.1]
  def change
    change_table :army_lists do |t|
      t.references :campaign, type: :uuid
      t.references :user, foreign_key: true, type: :uuid
      t.references :game_system, foreign_key: true, type: :uuid
    end

    ArmyList.find_each do |list|
      army = list.army
      list.user = army.user
      list.game_system = army.game_system
      list.save!
    end

    change_column_null :army_lists, :user_id, false
    change_column_null :army_lists, :game_system_id, false
    change_column_null :army_lists, :army_id, true
  end
end
