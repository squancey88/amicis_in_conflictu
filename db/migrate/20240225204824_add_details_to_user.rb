class AddDetailsToUser < ActiveRecord::Migration[7.1]
  def change
    change_table(:users, bulk: true) do |t|
      t.column :firstname, :string
      t.column :surname, :string
    end
  end
end
