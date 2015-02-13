class Movie < ActiveRecord::Base
  has_many :movies_properties
  has_many :users, :through => :movies_properties


end
