class MoviePropertiesController < ApplicationController

	def create
		id_user = params[:id_user]
		id_movie = params[:id_movie]
		state = params[:state]

		result = Tmdb::Movie.detail(id_movie)
		trailer = Tmdb::Movie.trailers(id_movie)
		trailer = trailer.youtube

		movie_title = result.title
		movie_description = result.overview
		movie_img = result.poster_path
		movie_trailer = trailer

		#ADD to movies table
		if(Movie.where(:id_movie_api => id_movie) == false)
			Movie.create(:id_movie_api => id_movie, :movie_name => movie_title, :description => movie_description, :trailer => movie_trailer, :movie_img => movie_img)
			id_movie_list =	Movie.where(:id_movie_api => id_movie)
			id_movie_list = id_movie_list.id
		else
			id_movie_list =	Movie.where(:id_movie_api => id_movie)
			id_movie_list = id_movie_list.id
		end

		#ADD to movie_properties
		if(MoviePropertie.where(:user_id => id_user).present? && MoviePropertie.where(:movie_id => id_movie_list).present?)
			liste = MoviePropertie.find_by("user_id = ? AND movie_id = ? ", id_user, id_movie_list)
			liste.update_attributes(status: state)
		else
			MoviePropertie.create(:user_id => id_user, :movie_id => id_movie_list, :status => state)
		end

		# redirect_to root_url
	end

end
