class ProjectUsersController < ApplicationController
  before_action :set_project_user, only: [:show, :edit, :update, :destroy]
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  # GET /project_users
  # GET /project_users.json
  def index
    @project = Project.find(params[:project_id])
    @project_users = ProjectUser.where("project_id = ?", params[:project_id])
  end

  # GET /project_users/1
  # GET /project_users/1.json
  def show
  end

  # GET /project_users/new
  def new
    @project = Project.find(params[:project_id])
    @project_user = ProjectUser.new
    @users_groups = UsersGroup.all
    @project_roles = ProjectUser::PROJECT_ROLES
    p @project_roles
    @users = User.select("id, name")
  end

  # GET /project_users/1/edit
  def edit
  end

  # POST /project_users
  # POST /project_users.json
  def create
    @project = Project.find(params[:project_id])
    # para = ActionController::Parameters.new({ project_user: { project_id: params[:project_id], user_id: params[:user_id], project_role: params[:project_role] }})
    # permitted = para.require(:project_user).permit(:project_id, :user_id, :project_role) 
    p params
    params[:project_user][:project_id] = params[:project_id]

    p params
    @project_user = ProjectUser.new(project_user_params)

    p @project_user

    respond_to do |format|

      if @project_user.save
        format.html { redirect_to project_project_users_path(@project), notice: 'Project user was successfully created.' }
        format.json { render :show, status: :created, location: @project_user }
      else
        puts @project_user.errors.full_messages
        format.html { render project_project_users_path(@project) }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_users/1
  # PATCH/PUT /project_users/1.json
  def update
    respond_to do |format|
      if @project_user.update(project_user_params)
        format.html { redirect_to @project_user, notice: 'Project user was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_user }
      else
        format.html { render :edit }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_users/1
  # DELETE /project_users/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @project_user.destroy
    respond_to do |format|
      format.html { redirect_to project_project_users_path(@project), notice: 'Project user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = ProjectUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_user_params
      params.require(:project_user).permit(:project_id, :user_id, :project_role)
    end
end
