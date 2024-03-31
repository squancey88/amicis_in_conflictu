class GamingGroupsController < ApplicationController
  before_action :set_gaming_group, only: %i[show edit update destroy update_membership remove_user invite_user]

  # GET /gaming_groups or /gaming_groups.json
  def index
    @gaming_groups = GamingGroup.all
  end

  # GET /gaming_groups/1 or /gaming_groups/1.json
  def show
  end

  # GET /gaming_groups/new
  def new
    @gaming_group = GamingGroup.new
  end

  # GET /gaming_groups/1/edit
  def edit
  end

  # POST /gaming_groups or /gaming_groups.json
  def create
    @gaming_group = GamingGroup.new(gaming_group_params)
    respond_to do |format|
      if @gaming_group.save
        UserGroupMembership.create!(gaming_group: @gaming_group, user: current_user, owner: true)
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Gaming group was successfully created." }
        format.json { render :show, status: :created, location: @gaming_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gaming_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaming_groups/1 or /gaming_groups/1.json
  def update
    respond_to do |format|
      if @gaming_group.update(gaming_group_params)
        format.html { redirect_to gaming_group_url(@gaming_group), notice: "Gaming group was successfully updated." }
        format.json { render :show, status: :ok, location: @gaming_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gaming_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaming_groups/1 or /gaming_groups/1.json
  def destroy
    @gaming_group.destroy!

    respond_to do |format|
      format.html { redirect_to gaming_groups_url, notice: "Gaming group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_membership
    user = User.find(params.permit(:user_id)[:user_id])
    membership = @gaming_group.user_group_memberships.find_by(user:)
    membership.owner = !membership.owner
    if membership.save
      redirect_to(@gaming_group, notice: "Membership updated")
    else
      redirect_to(@gaming_group, alert: "Unable to update membership")
    end
  end

  def remove_user
    user = User.find(params.permit(:user_id)[:user_id])
    membership = @gaming_group.user_group_memberships.find_by(user:)
    if membership.destroy
      redirect_to(@gaming_group, notice: "User removed from group")
    else
      redirect_to(@gaming_group, alert: "Unable to remove user")
    end
  end

  def invite_user
    user = FindOrInviteUserService.call(email: params.permit(:email)[:email], inviter: current_user)
    membership = UserGroupMembership.new(user:, gaming_group: @gaming_group, owner: params.permit(:owner)[:owner])
    if membership.save
      redirect_to(@gaming_group, notice: "User added to group")
    else
      redirect_to(@gaming_group, alert: "Unable to add user")
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gaming_group
    @gaming_group = GamingGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gaming_group_params
    params.require(:gaming_group).permit(:name)
  end
end
