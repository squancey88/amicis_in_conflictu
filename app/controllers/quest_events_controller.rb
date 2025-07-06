class QuestEventsController < ApplicationController
  include WithinWorld

  before_action :set_quest
  before_action :set_quest_event, only: %i[edit update destroy]

  def index
    @quest_events = if params[:game_id]
      game = Game.find(params[:game_id])
      @quest.quest_events.where.not(id: game.game_quest_events.select(:quest_event_id))
    else
      @quest.quest_events
    end
  end

  def edit
  end

  def show
  end

  def new
  end

  def create
    @quest_event = @quest.quest_events.new(quest_event_params)
    respond_to do |format|
      if @quest_event.save
        format.html { redirect_to world_quest_url(@world, @quest), notice: "Quest event was successfully created." }
        format.json { render :show, status: :created, location: @quest_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quest_event.update(quest_event_params)
        format.html { redirect_to edit_world_quest_quest_event_url(@world, @quest, @quest_event), notice: "Quest event was successfully updated." }
        format.json { render :show, status: :ok, location: @quest_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quest_event.destroy!

    respond_to do |format|
      format.html { redirect_to world_quest_url(@world, @quest), notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def new_record # override WithinWorld
    set_quest
    @quest_event = @quest.quest_events.new
  end

  def get_record # override WithinWorld
    Quest.find(params[:quest_id])
  end

  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def set_quest_event
    @quest_event = QuestEvent.find(params[:id])
  end

  def quest_event_params
    params.require(:quest_event).permit(:title, :blurb,
      quest_event_datum_attributes: [:id, :type, :title, :content])
  end
end
