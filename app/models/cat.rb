class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex

  has_many :cat_rental_requests, :dependent => :destroy

  validates :color, :inclusion => {:in => %w(blue red green),
    :message => "%{value} is not a valid color."}

  validates :name, :presence => true



end
