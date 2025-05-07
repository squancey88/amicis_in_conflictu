module WorldVisibility
  extend ActiveSupport::Concern

  included do
    enum :visibility, [:gm_only, :visible, :revealable]
  end

  class_methods do
  end
end
