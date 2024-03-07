class CreateGamingGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :gaming_groups, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
