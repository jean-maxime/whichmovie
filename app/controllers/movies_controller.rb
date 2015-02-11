class MoviesController < ApplicationController

	def index
		@popular = Tmdb::Movie.popular
		@upcoming = Tmdb::Movie.upcoming
		@now = Tmdb::Movie.now_playing
		if params[:search].present?
			search = params[:search]
			@result = Tmdb::Movie.find(search)
		end
	end

end
