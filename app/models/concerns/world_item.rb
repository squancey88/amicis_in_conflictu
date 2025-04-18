module WorldItem
  extend ActiveSupport::Concern

  included do
  end

  class_methods do
    def connect_world_items(klass, name)
      has_many name, dependent: :destroy, inverse_of: :relates_to, class_name: klass.to_s
    end
  end
end
