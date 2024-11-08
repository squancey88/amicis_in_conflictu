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
    unless @gaming_group.is_user?(current_user)
      if request.format.html?
        redirect_to(@gaming_group)
      else
        render json: {error: "No access"}, status: :forbidden
      end
    end
  end
end
