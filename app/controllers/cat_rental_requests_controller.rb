class CatRentalRequestsController < ApplicationController
  before_filter :find_cat

  def create
    request = @cat.cat_rental_requests.new(params[:cat_rental_request])
    if request.save
      redirect_to cat_path(@cat)
    else
      render :new
    end

  end

  def new
    render :new
  end

  def update
    if @user && @user == @cat.user
      @request = CatRentalRequest.find(params[:id])
      @request.approve if params[:cat_rental_request][:status] == "approved"
      @request.deny if params[:cat_rental_request][:status] == "denied"

      flash[:notices] ||= []
      flash[:notices] << "Request updated!"      
      
      redirect_to cat_path(@request.cat)
    else
      flash[:notices] ||= []
      flash[:notices] << "You cannot update this cat!"
      render :json => @request
    end

  end
  
  def find_cat
    @cat = Cat.find(params[:cat_id])
  end


end
