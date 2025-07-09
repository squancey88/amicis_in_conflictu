class AddHiddenNotesToWorlItems < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :world_owner_notes, :jsonb, default: {}
    add_column :articles, :world_owner_notes, :jsonb, default: {}

    change_table :characters do |t|
      t.jsonb :world_owner_notes, default: {}
      t.jsonb :player_notes, default: {}
      t.jsonb :shared_notes, default: {}
    end
  end
end
