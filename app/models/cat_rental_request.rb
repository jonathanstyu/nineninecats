class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date, :status

  belongs_to :cat

  include ActiveModel::Validations
  validates_with RequestValidator

  def approve

  end


end
