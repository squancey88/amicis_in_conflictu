class AddRepeatableToUnitStatModifier < ActiveRecord::Migration[7.1]
  def change
    change_table(:unit_stat_modifiers, bulk: true) do |t|
      t.boolean :repeatable, default: true
      t.integer :repeat_cost, default: 0
      t.boolean :increase_cost_by_additional_instances, default: true # Used to indicate that repeat cost is mulitple by number of instances
      # e.g. 2 = cost + repeat_cost * 1, 3 = cost + (repeat_cost * 2)
      t.integer :list_cost_increase, default: 0
    end
  end
end
