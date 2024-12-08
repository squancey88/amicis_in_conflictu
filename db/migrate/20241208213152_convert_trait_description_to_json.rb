class ConvertTraitDescriptionToJson < ActiveRecord::Migration[7.1]
  include ApplicationHelper
  def change
    add_column :unit_traits, :rich_description, :jsonb

    UnitTrait.find_each do |trait|
      trait.rich_description = simple_text_to_rich(trait.description)
      trait.save!
    end
  end
end
