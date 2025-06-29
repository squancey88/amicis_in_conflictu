class EquipmentAttachment < ApplicationRecord
  belongs_to :equipment
  belongs_to :attached_to, polymorphic: true

  before_create :enough_cost_in_list

  def enough_cost_in_list
    if attached_to.instance_of? ArmyList
      if !attached_to.starting_cost.nil? && equipment.cost > attached_to.remaining_cost
        throw :abort
      end
    end
  end
end

# == Schema Information
#
# Table name: equipment_attachments
#
#  id               :uuid             not null, primary key
#  attached_to_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  attached_to_id   :uuid             not null
#  equipment_id     :uuid             not null
#
# Indexes
#
#  index_equipment_attachments_on_attached_to   (attached_to_type,attached_to_id)
#  index_equipment_attachments_on_equipment_id  (equipment_id)
#
# Foreign Keys
#
#  fk_rails_...  (equipment_id => equipment.id)
#
