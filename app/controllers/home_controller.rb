class HomeController < ApplicationController
  def index
    if current_user.present?
    end
    @users = User.all
  end
end
