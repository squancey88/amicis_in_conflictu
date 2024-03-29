class AddNotesToGamingSession < ActiveRecord::Migration[7.1]
  def change
    add_column :gaming_sessions, :notes, :jsonb
  end
end
