class AddSurrenderedFlagToPlayer < ActiveRecord::Migration[7.1]
  def change
    change_table(:players, bulk: true) do |t|
      t.boolean :surrendered, default: false
    end
  end
end
