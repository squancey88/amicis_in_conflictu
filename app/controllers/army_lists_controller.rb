class ArmyListsController < ApplicationController
  before_action :set_army_list, only: %i[show edit update destroy]

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_army_list
    @army_list = ArmyList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def army_list_params
    params.require(:army_list).permit(:name, :details, :army_id, :cost)
  end
end
