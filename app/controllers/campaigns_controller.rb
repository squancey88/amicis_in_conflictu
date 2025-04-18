class CampaignsController < ApplicationController
  include WithinGamingGroup
  before_action :set_campaign, only: %i[show edit update destroy]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = if params[:filter]
      @gaming_group.campaigns.where(**filter_params)
    else
      @gaming_group.campaigns.all
    end
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new(game_system: get_game_system, config: {})
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.gaming_group = @gaming_group

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to gaming_group_campaign_url(@gaming_group, @campaign), notice: "Campaign was successfully created." }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to gaming_group_campaign_url(@gaming_group, @campaign), notice: "Campaign was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy!

    respond_to do |format|
      format.html { redirect_to gaming_group_campaigns_url(@gaming_group), notice: "Campaign was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_game_system
    GameSystem.find(params.permit(:game_system_id)[:game_system_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campaign_params
    params.require(:campaign).permit(:name, :game_system_id, :list_start_cost, :world_id, :game_master_id, config: {})
  end

  def filter_params
    params.require(:filter).permit(:game_system_id)
  end
end
