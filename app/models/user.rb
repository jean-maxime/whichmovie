class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :movies_properties
  has_many :movies, :through => :movies_properties

  def status(user_id, id_movie_api)
  	movie = Movie.where("id_movie_api = ?", id_movie_api).pluck(:id)
    MoviesProperty.where("user_id = ? AND movie_id = ?", user_id, movie).pluck(:status)
  end

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
