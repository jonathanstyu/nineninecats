class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(params[:user])
    if user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    render :json => current_user
  end

end
