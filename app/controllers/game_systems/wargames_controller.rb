module GameSystems
  class WargamesController < ApplicationController
    before_action :set_wargame, only: %i[show edit update destroy]
    before_action :verify_admin

    # GET /wargames/1 or /wargames/1.json
    def show
    end

    # GET /wargames/new
    def new
      @wargame = Wargame.new
    end

    # GET /wargames/1/edit
    def edit
    end

    # POST /wargames or /wargames.json
    def create
      @wargame = Wargame.new(wargame_params)
      respond_to do |format|
        if @wargame.save
          format.html { redirect_to game_systems_wargame_url(@wargame), notice: "Game system was successfully created." }
          format.json { render :show, status: :created, location: @wargame }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @wargame.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /wargames/1 or /wargames/1.json
    def update
      respond_to do |format|
        if @wargame.update(wargame_params)
          format.html { redirect_to game_systems_wargame_url(@wargame), notice: "Game system was successfully updated." }
          format.json { render :show, status: :ok, location: @wargame }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @wargame.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /wargames/1 or /wargames/1.json
    def destroy
      @wargame.destroy!

      respond_to do |format|
        format.html { redirect_to game_systems_url, notice: "Game system was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def add_new_stat_row
      helpers.fields GameSystems::Wargame.new do |f|
        f.fields_for :unit_stat_definitions, UnitStatDefinition.new, child_index: Time.now.to_i do |ff|
          render turbo_stream: turbo_stream.append(
            "definition_list",
            partial: "unit_stat_definitions/form_row",
            locals: {form: ff}
          )
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_wargame
      @wargame = Wargame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wargame_params
      if params["game_systems_wargame"]["game_config_json_string"]
        params["game_systems_wargame"]["game_config"] = JSON.parse(params["game_systems_wargame"]["game_config_json_string"])
      end
      params.require(:game_systems_wargame).permit(:name, :slug, :edition, :competitive, :has_armies, :has_army_lists,
        game_config: {},
        unit_stat_definitions_attributes: [:id, :name, :label, :stat_type, :min, :max, :sort])
    end
  end
end
