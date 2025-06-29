class AddConfigToCharacterTypes < ActiveRecord::Migration[7.1]
  def change
    add_column :character_types, :config, :jsonb, default: {}
  end
end
