class AddConfigAndHistoryToCharacter < ActiveRecord::Migration[7.1]
  def change
    change_table :characters do |c|
      c.jsonb :config, default: {}
      c.jsonb :history, default: {}
    end
  end
end
