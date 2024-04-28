class AddArmyFlagsToGameSystem < ActiveRecord::Migration[7.1]
  def change
    change_table(:game_systems, bulk: true) do |t|
      t.boolean :has_armies, default: false
      t.boolean :has_army_lists, default: false
    end
  end
end
