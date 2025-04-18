module WorldVisibilityAccess
  extend ActiveSupport::Concern

  included do
    include WithinWorld
    before_action :check_view_access, only: [:show] # standard:disable Rails/LexicallyScopedActionFilter
  end

  class_methods do
  end

  def check_view_access
    record = get_record
    if record.world.owner != current_user
      if record.gm_only?
        redirect_to record.world, notice: "Only visible to Owner"
      elsif record.revealable?
        # TODO
        redirect_to record.world
      end
    end
  end
end
