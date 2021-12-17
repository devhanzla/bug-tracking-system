class ProjectsController < ApplicationController
  def index
    if current_user.manager?
      @projects = current_user.created_projects
    else
      @projects = current_user.projects
    end
  end

  def new
    print "-------------------------------- asdfasdf"
    @managers = (User.where(user_type:'Manager')).pluck(:username)
    @usernames = (User.where.not(user_type:'Manager')).pluck(:username)
    @project = Project.new
  end

  def edit
    if Project.exists?(params[:id])
      @managers = (User.where(user_type:'Manager')).pluck(:username)
      @usernames = (User.where.not(user_type:'Manager')).pluck(:username)
      @project = Project.find(params[:id])
    else
      flash[:alert] = "INVALID URL!"
      redirect_to root_path
    end
  end

  def show
    if Project.exists?(params[:id])
      @project = Project.find(params[:id])
    else
      flash[:alert] = "INVALID URL!"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def create
    flash[:notice] = "Bug Was Created Succesully!"
    redirect_to bug_path(@bug)
    project_params = project_form_params
    @project = Project.new(
      title: project_params["title"],
      description: project_params["description"],
      manager_id: User.where(username: project_params["manager_id"])[0].id,
      user_ids: User.where(username: project_params["user_ids"])[0].id
    )
    if @project.save
      flash[:notice] = "Project Was Created Succesully!"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def testing
    @bug_params
  end

  private
    def project_form_params
      params.require(:project).permit(
        :title,
        :description,
        :manager_id,
        :user_ids
      )
    end
end
