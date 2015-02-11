class MoviePropertiesController < ApplicationController

	def create
		id_user = params[:id_user]
		id_movie = params[:id_movie]
		state = params[:state]

		if(MoviePropertie.where(:user_id => id_user).present? && MoviePropertie.where(:movie_id => id_movie).present?)
			liste = MoviePropertie.find_by("user_id = ? AND movie_id = ? ", id_user, id_movie)
			liste.update_attributes(status: state)
		else
			MoviePropertie.create(:user_id => id_user, :movie_id => id_movie, :status => state)
		end

		redirect_to root_url
	end

end
