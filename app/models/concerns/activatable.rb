module Activatable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(active: true) }
  end

  class_methods do
  end
end
