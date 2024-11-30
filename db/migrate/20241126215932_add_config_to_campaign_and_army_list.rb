class AddConfigToCampaignAndArmyList < ActiveRecord::Migration[7.1]
  def change
    change_table(:army_lists, bulk: true) do |t|
      t.jsonb :initial_values
      t.integer :starting_cost
    end

    change_table(:campaigns, bulk: true) do |t|
      t.jsonb :config
      t.integer :list_start_cost
    end
  end
end
