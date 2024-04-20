class AddingColumnsToGame < ActiveRecord::Migration[7.1]
  def change
    change_table(:games, bulk: true) do |t|
      t.jsonb :data
      t.jsonb :notes
    end
  end
end
