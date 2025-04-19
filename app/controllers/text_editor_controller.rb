class TextEditorController < ApplicationController
  def link
    items = if session[:world_id]
      World.find(session[:world_id]).text_editor_link_search(search_params[:search])
    end
    render json: {
      success: true,
      items:
    }
  end

  def search_params
    params.permit(:search)
  end
end
