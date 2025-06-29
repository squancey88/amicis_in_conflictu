class TextEditorController < ApplicationController
  def link
    items = world&.text_editor_link_search(search_params[:search])
    render json: {
      success: true,
      items: items || []
    }
  end

  private

  def search_params
    params.permit(:search)
  end

  def world
    @world ||= get_world
  end

  def get_world
    return World.find(session[:world_id]) if session[:world_id]

    if params[:campaign_id]
      campaign = Campaign.find(params[:campaign_id])
      campaign.world
    end
  end
end
