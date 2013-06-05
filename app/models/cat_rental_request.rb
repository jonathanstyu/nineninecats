class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date, :status

  belongs_to :cat

  include ActiveModel::Validations
  validates_with RequestValidator

  def approve
    self.status = 'approved'

    self.cat.cat_rental_requests.each do |request|
      next if request == self
      if self.begin_date < request.end_date &&
        self.end_date > request.begin_date
        request.status = 'denied'
        request.save!
      end
    end
    self.save!
  end


end
