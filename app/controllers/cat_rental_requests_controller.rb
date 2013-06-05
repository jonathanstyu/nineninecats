class CatRentalRequestsController < ApplicationController

  def create
    @cat = Cat.find(params[:cat_id])
    request = @cat.cat_rental_requests.new(params[:cat_rental_request])
    if request.save
      redirect_to cat_path(@cat)
    else
      render :new
    end

  end

  def new
    @cat = Cat.find(params[:cat_id])
    render :new
  end


end
