module WorldVisibility
  extend ActiveSupport::Concern

  included do
    enum :visibility, {gm_only: 0, visible: 1, revealable: 2}
  end

  class_methods do
  end
end
