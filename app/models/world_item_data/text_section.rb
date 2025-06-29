module WorldItemData
  class TextSection < WorldItemDatum
    store_accessor :data, :title
    store_accessor :data, :content
  end
end

# == Schema Information
#
# Table name: world_item_data
#
#  id              :uuid             not null, primary key
#  category        :string
#  data            :jsonb
#  order           :integer
#  relates_to_type :string           not null
#  type            :string
#  visibility      :integer          default("gm_only")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  relates_to_id   :uuid             not null
#
# Indexes
#
#  index_world_item_data_on_relates_to  (relates_to_type,relates_to_id)
#
