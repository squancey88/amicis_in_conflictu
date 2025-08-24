class CreateOrganisations < ActiveRecord::Migration[7.1]
  def change
    create_table :organisations, id: :uuid do |t|
      t.string :name
      t.jsonb :world_owner_notes, default: {}
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.references :organisation_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
