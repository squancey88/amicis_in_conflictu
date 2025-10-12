module Api
  class GamingGroupsController < BaseController
    def index
      render json: current_user.gaming_groups.map { GamingGroupSerializer.new(_1).serialize }
    end
  end
end
