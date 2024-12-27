class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters, id: :uuid do |t|
      t.string :given_name
      t.string :family_name
      t.jsonb :physical_description

      t.references :world, null: false, foreign_key: true, type: :uuid
      t.references :born_during, null: false, foreign_key: {to_table: :time_periods}, type: :uuid
      t.references :character_type, null: false, foreign_key: true, type: :uuid
      t.references :character_species_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
