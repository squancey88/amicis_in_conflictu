FactoryBot.define do
  factory :equipment_attachment do
    equipment
    attached_to { create(:army_list) }
  end
end
