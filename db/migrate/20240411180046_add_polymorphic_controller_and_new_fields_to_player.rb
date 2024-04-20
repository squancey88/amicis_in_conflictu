class AddPolymorphicControllerAndNewFieldsToPlayer < ActiveRecord::Migration[7.1]
  def change
    change_table(:players, bulk: true) do |t|
      t.remove_references :user
      t.references :controller, polymorphic: true, type: :uuid
      t.jsonb :game_data
      t.jsonb :notes
    end
  end
end
