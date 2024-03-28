class AddTypeToGameSystem < ActiveRecord::Migration[7.1]
  def change
    add_column :game_systems, :type, :string
  end
end
