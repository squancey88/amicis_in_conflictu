class PlayerArmy < ApplicationRecord
  belongs_to :player
  belongs_to :army
  belongs_to :army_list, optional: true
end
