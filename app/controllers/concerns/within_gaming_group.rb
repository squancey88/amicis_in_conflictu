module WithinGamingGroup
  extend ActiveSupport::Concern

  included do
    before_action :set_gaming_group
    before_action :check_group_access
  end

  def set_gaming_group
    @gaming_group = GamingGroup.find(params[:gaming_group_id])
  end

  def check_group_access
    if request.format.html?
      redirect_to(@gaming_group) unless @gaming_group.is_user?(current_user)
    else
      # TODO Deal with JSON
    end
  end
end
