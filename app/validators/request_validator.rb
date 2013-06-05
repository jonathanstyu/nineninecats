class RequestValidator < ActiveModel::Validator

  def validate(record)
    @catrecords = CatRentalRequest.where(:cat_id => record.cat_id,
      :status => "approved")

    # checks for the error
    if record.begin_date > record.end_date || record.end_date < record.begin_date
      record.errors[:begin_date] << "Begin and end dates do not work"
    end

    unless ['approved', 'denied', 'undecided'].include?(record.status.downcase)
      record.errors[:status] << "Not valid status"
    end

    @catrecords.each do |other_record|
      if record.begin_date < other_record.end_date && record.end_date > other_record.begin_date && record.status == 'approved'
        record.errors[:status] << "Overlaps with existing approved request"
      end
    end

  end

end