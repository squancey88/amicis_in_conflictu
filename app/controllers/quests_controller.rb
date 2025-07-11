class QuestsController < ApplicationController
  include WithinWorld

  before_action :set_quest, only: %i[show edit update destroy]

  # GET /quests or /quests.json
  def index
    @quests = @world.quests
  end

  # GET /quests/1 or /quests/1.json
  def show
  end

  # GET /quests/new
  def new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests or /quests.json
  def create
    @quest = new_record(quest_params)
    @quest.created_by = current_user

    respond_to do |format|
      if @quest.save
        format.html { redirect_to world_quest_url(@world, @quest), notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to world_quest_url(@world, @quest), notice: "Quest was successfully updated." }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest.destroy!

    respond_to do |format|
      format.html { redirect_to @world, notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quest
    @quest = Quest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quest_params
    params.require(:quest).permit(:title, :blurb)
  end
end
