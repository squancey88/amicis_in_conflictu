class FixTypeOnUnitTraitCategoryMappingPolymorphicRelationship < ActiveRecord::Migration[7.1]
  def change
    change_table(:unit_trait_category_mappings) do |t|
      t.remove_references :mapped_to, polymorphic: true
    end
    change_table(:unit_trait_category_mappings) do |t|
      t.references :mapped_to, polymorphic: true, type: :uuid
    end
  end
end
