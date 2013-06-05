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

  def update

    @request = CatRentalRequest.find(params[:id])
    @request.approve if params[:cat_rental_request][:status] == "approved"
    @request.deny if params[:cat_rental_request][:status] == "denied"
    redirect_to cat_path(@request.cat)
  end


end
