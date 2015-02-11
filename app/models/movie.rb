class Movie < ActiveRecord::Base
  has_many :movie_properties
  has_many :users, :through => :movie_properties
end
