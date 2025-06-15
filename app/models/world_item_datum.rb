class WorldItemDatum < ApplicationRecord
  include WorldVisibility

  belongs_to :relates_to, polymorphic: true
end
