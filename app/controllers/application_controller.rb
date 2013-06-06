class ApplicationController < ActionController::Base
  # protect_from_forgery
  before_filter :find_current_user

  def current_user
    user = User.find_by_session_token(session[:session_token])
  end
  
  def find_current_user 
    @user = self.current_user
  end
  
end
