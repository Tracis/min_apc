class UsersGroupsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  # GET /users_groups
  # GET /users_groups.json
  def index
    @users_groups = UsersGroup.where("group_id = ?", params[:group_id])
  end

  # GET /users_groups/1
  # GET /users_groups/1.json
  def show
  end

  def create_collection
    group_id = params[:group_id]
    params[:id].each do |user_id|
      para = ActionController::Parameters.new({ users_group: { group_id: group_id, user_id: user_id }})
      permitted = para.require(:users_group).permit(:group_id, :user_id) 
      @users_group = UsersGroup.new(permitted)

      @users_group.save

    end

    respond_to do |format|
        if @users_group.save
          format.html { redirect_to group_users_groups_path, notice: '添加用户成功!' and return }
          format.json { render :show, status: :created, location: @users_group }
        else
          format.html {render new_group_users_group(@users_group)}
          format.json {render render json: @users_group.errors, status: :unprocessable_entity}
        end
      end

  end

  # GET /users_groups/new
  def new
    @users_groups = UsersGroup.select(:user_id).where("group_id = ?", params[:group_id])
    @users = User.all
    @users_hash = {}

    @users.each do |user|
      @users_hash[user.id] = user.name
    end

    @users_groups.each do |_users_group|
      @users_hash[_users_group.user_id] = false
    end

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

  private
    def users_group_params
      params.require(:users_group).permit(:group_id, :user_id)
    end


end
