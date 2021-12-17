class HomeController < ApplicationController
  def index
    if user_signed_in?
      @users = User.all
    else
      @msg = "Sign in OR REGISTER TO SEE AVAILABLE OPTIONS"
    end
  end
end
