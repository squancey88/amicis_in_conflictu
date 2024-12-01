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
