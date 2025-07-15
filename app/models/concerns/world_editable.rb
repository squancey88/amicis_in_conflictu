module WorldEditable
  extend ActiveSupport::Concern

  included do
    def can_edit?(user)
      world.owner == user
    end
  end
end
