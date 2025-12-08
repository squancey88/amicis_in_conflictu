module Mapping
  class MapsController < ApplicationController
    include WithinWorld

    before_action :set_map, only: %i[show edit update]

    def index
      @pagy, @maps = pagy(@world.maps)
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      @map = new_record(map_params)

      if @map.save
        redirect_to edit_world_map_url(@world, @map), notice: "New map created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
    end

    def destroy
    end

    private

    def set_map
      @map = Map.find(params[:id])
    end

    def map_params
      params.require(:mapping_map).permit(:name)
    end
  end
end
