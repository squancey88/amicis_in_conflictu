module Activatable
  extend ActiveSupport::Concern

  included do
    scope :are_active, -> { where(active: true) }
  end

  class_methods do
  end
end
