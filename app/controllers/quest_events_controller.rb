class QuestEventsController < ApplicationController
  include WithinWorld

  before_action :set_quest
  before_action :set_quest_event, only: %i[edit update]

  def index
    @quest_events = @quest.quest_events
  end

  def edit
  end

  def show
  end

  def new
    @quest_event = @quest.quest_events.new
  end

  def create
    @quest_event = @quest.quest_events.new(quest_event_params)

    respond_to do |format|
      if @quest_event.save
        format.html { redirect_to quest_url(@quest), notice: "Quest event was successfully created." }
        format.json { render :show, status: :created, location: @quest_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    respond_to do |format|
      if @quest_event.update(quest_event_params)
        format.html { redirect_to edit_quest_quest_event_url(@quest, @quest_event), notice: "Quest event was successfully updated." }
        format.json { render :show, status: :ok, location: @quest_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest.destroy!

    respond_to do |format|
      format.html { redirect_to quests_url, notice: "Quest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_record
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
      quest_event_datum_attributes: [:id, :type, :title, :data])
  end
end
