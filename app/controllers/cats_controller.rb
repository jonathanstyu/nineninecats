class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def new
    @user = current_user
    render :new
  end

  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      render :show
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def show
    @cat = Cat.find(params[:id])
    @user = self.current_user
    render :show
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(params[:cat])
      render :show
    else
      render :new
    end
  end

end
