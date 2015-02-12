class MoviesPropertiesController < ApplicationController

	def index
		id_user = current_user.id

		# on sélectionne tous les id des films dans MoviePropertie qui sont stocker dans Movie

		 @movies = current_user.movies

		#
		# row_properties.attributes.movie_id.each do |movie|
		# 	@movie_hash[cpt] = Movie.where(:id => movie)
		# 	cpt += 1
		# end



		# @movie_title = movie_properties
		# @movie_description = movie_properties.overview
		# @movie_img = movie_properties.poster_path
		# @movie_trailer = movie_properties
	end

	def create
		id_user = params[:id_user]
		id_movie = params[:id_movie]
		state = params[:state]

		result = Tmdb::Movie.detail(id_movie)
		trailer = Tmdb::Movie.trailers(id_movie)
		trailer = trailer.youtube

		trailer.each do |task|
			 trailer = task.source
		end

		movie_title = result.title
		movie_description = result.overview
		movie_img = result.poster_path
		movie_trailer = trailer

		#ADD to movies table
		if(Movie.where(:id_movie_api => id_movie).empty?)
			Movie.create(:id_movie_api => id_movie, :movie_name => movie_title, :description => movie_description, :trailer => movie_trailer, :image_url => movie_img)
			id_movie_list =	Movie.where(:id_movie_api => id_movie).first
			id_movie_list = id_movie_list.id
		else
			id_movie_list =	Movie.where(:id_movie_api => id_movie).first
			id_movie_list = id_movie_list.id
		end

		#ADD to movie_properties
		if(MoviesProperty.where(:user_id => id_user).present? && MoviesProperty.where(:movie_id => id_movie_list).present?)
			liste = MoviesProperty.find_by("user_id = ? AND movie_id = ? ", id_user, id_movie_list)
			liste.update_attributes(status: state)
		else
			MoviesProperty.create(:user_id => id_user, :movie_id => id_movie_list, :status => state)
		end

		redirect_to root_url
	end

end
