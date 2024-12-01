class ArmyListsController < ApplicationController
  before_action :set_army_list, only: %i[show edit update destroy attach_equipment remove_equipment]

  # GET /army_lists or /army_lists.json
  def index
    @army_lists = current_user.army_lists
  end

  # GET /army_lists/1 or /army_lists/1.json
  def show
  end

  # GET /army_lists/new
  def new
    @army_list = ArmyList.new
  end

  # GET /army_lists/1/edit
  def edit
  end

  # POST /army_lists or /army_lists.json
  def create
    @army_list = ArmyList.new(army_list_params)
    @army_list.user = current_user

    respond_to do |format|
      if @army_list.save
        format.html { redirect_to army_list_url(@army_list), notice: "Army list was successfully created." }
        format.json { render :show, status: :created, location: @army_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @army_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /army_lists/1 or /army_lists/1.json
  def update
    respond_to do |format|
      if @army_list.update(army_list_params)
        format.html { redirect_to army_list_url(@army_list), notice: "Army list was successfully updated." }
        format.json { render :show, status: :ok, location: @army_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @army_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /army_lists/1 or /army_lists/1.json
  def destroy
    @army_list.destroy!

    respond_to do |format|
      format.html { redirect_to army_lists_url, notice: "Army list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def attach_equipment
    equipment = Equipment.find(equipment_params[:equipment_id])
    attachment = EquipmentAttachment.new(equipment:, attached_to: @army_list)
    if attachment.save
      redirect_to @army_list
    else
      redirect_to @army_list, alert: "Unable to add equipment, not enough cost"
    end
  end

  def remove_equipment
    ea = EquipmentAttachment.find(equipment_attachments_params[:equipment_attachment_id])
    if ea.destroy!
      redirect_to @army_list
    else
      redirect_to @army_list, notice: "Unable to remove equipment"
    end
  end

  private

  def equipment_params
    params.permit(:equipment_id)
  end

  def equipment_attachments_params
    params.permit(:equipment_attachment_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_army_list
    @army_list = ArmyList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def army_list_params
    params.require(:army_list).permit(:name, :details, :army_id, :game_system_id, :campaign_id)
  end
end
