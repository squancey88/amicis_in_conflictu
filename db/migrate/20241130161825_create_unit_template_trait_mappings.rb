class CreateUnitTemplateTraitMappings < ActiveRecord::Migration[7.1]
  def change
    create_table :unit_template_trait_mappings, id: :uuid do |t|
      t.references :unit_template, null: false, foreign_key: true, type: :uuid
      t.references :unit_trait, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
