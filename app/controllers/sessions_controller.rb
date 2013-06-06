class SessionsController < ApplicationController

  def new

    render :new

  end

  def create
    user = User.find_by_username(params[:user][:username])

    if user.nil?
      render :json => {'error' => 'Incorrect username.'}
      return
    end

    if user.verify_password(params[:user][:password])
      session[:session_token] = user.generate_token!
      render :json => user
    else
      render :new
    end
  end

  def destroy

  end

end