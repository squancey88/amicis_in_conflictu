class UnitTemplateStat < ApplicationRecord
  belongs_to :unit_template
  belongs_to :unit_stat_definition

  def current_value = base_value
end

# == Schema Information
#
# Table name: unit_template_stats
#
#  id                      :uuid             not null, primary key
#  base_value              :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  unit_stat_definition_id :uuid             not null
#  unit_template_id        :uuid             not null
#
# Indexes
#
#  index_unit_template_stats_on_unit_stat_definition_id  (unit_stat_definition_id)
#  index_unit_template_stats_on_unit_template_id         (unit_template_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_stat_definition_id => unit_stat_definitions.id)
#  fk_rails_...  (unit_template_id => unit_templates.id)
#
