class TeamsController < ApplicationController
  include WithinGamingGroup
  before_action :set_team, only: %i[update destroy]

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
    @team.gaming_group = @gaming_group

    respond_to do |format|
      if @team.save
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Team not created.", status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Team not updated.", status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy!

    respond_to do |format|
      format.html { redirect_to gaming_group_url(@gaming_group), notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end
end
