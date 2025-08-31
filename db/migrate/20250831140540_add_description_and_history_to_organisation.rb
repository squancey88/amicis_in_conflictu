class AddDescriptionAndHistoryToOrganisation < ActiveRecord::Migration[7.1]
  def change
    change_table(:organisations, bulk: true) do |t|
      t.jsonb :description, default: {}
      t.jsonb :history, default: {}
    end
  end
end
