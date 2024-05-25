class GamingSessionsController < ApplicationController
  before_action :set_gaming_session, only: %i[show edit update destroy]
  before_action :has_access, only: %i[show edit update destroy]

  # GET /gaming_sessions/1 or /gaming_sessions/1.json
  def show
  end

  # GET /gaming_sessions/new
  def new
    @gaming_session = GamingSession.new
  end

  # GET /gaming_sessions/1/edit
  def edit
  end

  # POST /gaming_sessions or /gaming_sessions.json
  def create
    @gaming_session = GamingSession.new(gaming_session_params)

    respond_to do |format|
      if @gaming_session.valid?
        if @gaming_session.gaming_group.is_user?(current_user)
          @gaming_session.save!
          format.html { redirect_to gaming_session_url(@gaming_session), notice: "Gaming session was successfully created." }
          format.json { render :show, status: :created, location: @gaming_session }
        else
          redirect_to(root_url, notice: "You cannot create a session for a group you are not a member of")
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gaming_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaming_sessions/1 or /gaming_sessions/1.json
  def update
    respond_to do |format|
      if @gaming_session.update(gaming_session_params)
        format.html { redirect_to gaming_session_url(@gaming_session), notice: "Gaming session was successfully updated." }
        format.json { render :show, status: :ok, location: @gaming_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gaming_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaming_sessions/1 or /gaming_sessions/1.json
  def destroy
    @gaming_session.destroy!

    respond_to do |format|
      format.html { redirect_to gaming_sessions_url, notice: "Gaming session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def has_access
    redirect_to(@gaming_session.gaming_group) unless @gaming_session.gaming_group.is_user?(current_user)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_gaming_session
    @gaming_session = GamingSession.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gaming_session_params
    params.require(:gaming_session).permit(:start_time, :gaming_group_id, :notes)
  end
end
