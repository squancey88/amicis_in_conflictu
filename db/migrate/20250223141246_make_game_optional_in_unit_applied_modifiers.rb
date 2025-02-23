class MakeGameOptionalInUnitAppliedModifiers < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:unit_applied_modifiers, :game_id, true)
  end
end
