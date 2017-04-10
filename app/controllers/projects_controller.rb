class ProjectsController < ApplicationController
  include SoftDelete
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.update_attribute(:deleted_at, Time.now)

    redirect_to projects_path
  end
  
  def create
    #render plain: params[:project].inspect
    @project = Project.new(proj_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(proj_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  private
    def proj_params
      params.require(:project).permit(:abbr_name, :name, :proj_types, :proj_start_time, :proj_end_time)
    end
end
