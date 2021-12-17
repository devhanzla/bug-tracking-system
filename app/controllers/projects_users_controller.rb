class ProjectsUsersController < ApplicationController
  def index
  end

  def new
    puts '-------------------------------------'
    puts 'INT THE PROJEcTS USERS NEW DEF'
    puts '-------------------------------------'
    @usernames = User.pluck(:username)
    @project_titles = Project.pluck(:title)
    @project_user = ProjectsUser.new
  end

  def edit
    @usernames = User.pluck(:username)
    @project_titles = Project.pluck(:title)
    @project_user = ProjectsUser.find(params[:id])
  end

  def create
  end
end
