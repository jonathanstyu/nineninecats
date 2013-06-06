class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    new_user = User.new(params[:user])
    if new_user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if @user.nil?
      render :json => {"nil" => "empty page"}
    else
      render :profile
    end
  end

end
