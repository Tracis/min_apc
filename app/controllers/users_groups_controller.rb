class UsersGroupsController < ApplicationController

  # GET /users_groups
  # GET /users_groups.json
  def index
    @users_groups = UsersGroup.where("group_id = ?", params[:group_id])
  end

  # GET /users_groups/1
  # GET /users_groups/1.json
  def show
  end

  # GET /users_groups/new
  def new
    @users_group = UsersGroup.new
    # @user = Users.find(params[:id])
  end

  # GET /users_groups/1/edit
  def edit
  end



  # DELETE /users_groups/1
  # DELETE /users_groups/1.json
  def destroy()
    UsersGroup.delete_all(["group_id = ? AND user_id = ?", params[:group_id], params[:id]])
    respond_to do |format|
      format.html { redirect_to group_users_groups_url, notice: 'Users group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
