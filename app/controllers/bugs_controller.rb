class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    puts "-------------------------------- "
    puts "Sample String"
    puts "-------------------------------- "
    @usernames = User.pluck(:username)
    @project_titles = Project.pluck(:title)
    @bug = Bug.new
  end

  def edit
    if Bug.exists?(params[:id])
      @usernames = User.pluck(:username)
      @project_titles = Project.pluck(:title)
      @bug = Bug.find(params[:id])
    else
      redirect_to new_bug_path
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def create
    bug_param = bug_params
    puts '------------------------------------------'
    puts bug_param
    puts '------------------------------------------'

    @bug = Bug.new(
      title: bug_param["title"],
      description: bug_param["description"],
      deadline: bug_param["deadline"],
      screenshot: bug_param["screenshot"],
      bug_type: bug_param["bug_type"],
      status: bug_param["status"],
      project_id: Project.where(title: bug_param["project_id"])[0].id,
      creator_id: User.where(username: bug_param["creator_id"])[0].id,
      solver_id: User.where(username: bug_param["solver_id"])[0].id
    )
    if @bug.save
      flash[:notice] = "Bug Was Created Succesully!"
      redirect_to bug_path(@bug)
    else
      render 'new'
    end
  end

  def testing
    @bug_params
  end

  private
    def bug_params
      params.require(:bug).permit(
        :title,
        :description,
        :deadline,
        :screenshot,
        :bug_type,
        :status,
        :project_id,
        :creator_id,
        :solver_id
      )
    end
end
