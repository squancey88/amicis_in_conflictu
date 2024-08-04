class AddAdminFlagToUser < ActiveRecord::Migration[7.1]
  def change
    change_table(:users, bulk: true) do |t|
      t.boolean :admin, default: false
    end
  end
end
