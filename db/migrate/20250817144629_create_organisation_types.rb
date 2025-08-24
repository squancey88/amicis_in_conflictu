class CreateOrganisationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :organisation_types, id: :uuid do |t|
      t.string :name
      t.references :world, null: false, foreign_key: true, type: :uuid
      t.jsonb :config, default: {}

      t.timestamps
    end
  end
end
