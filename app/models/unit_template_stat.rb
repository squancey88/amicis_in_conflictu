class UnitTemplateStat < ApplicationRecord
  belongs_to :unit_template
  belongs_to :unit_stat_definition

  def current_value = base_value
end
