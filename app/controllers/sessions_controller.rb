class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user_found = User.find_by_username(params[:user][:username])
    
    if user_found.nil?
      render :json => {'error' => 'Incorrect username.'}
      return
    end

    if user_found.verify_password(params[:user][:password])
      session[:session_token] = user_found.generate_token!
      render :json => user_found
    else
      flash[:notices] ||= []
      flash[:notices] << "Go away, hacker."
      
      render :new
    end
  end

  def destroy
    user.session_token = nil 
    user.save! 
    
    session[:session_token] = nil 
    
    flash[:notices] ||= []
    flash[:notices] << "You have logged out!"
    
    redirect_to root_url 
  end

end
