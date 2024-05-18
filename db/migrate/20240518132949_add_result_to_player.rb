class AddResultToPlayer < ActiveRecord::Migration[7.1]
  def change
    change_table(:players, bulk: true) do |t|
      t.integer :result, default: 0
      t.remove :winner, type: :boolean
    end
  end
end
