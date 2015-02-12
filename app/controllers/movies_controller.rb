class MoviesController < ApplicationController
	
	def show
		if params[:id].present?
			id = params[:id]
			@result = Tmdb::Movie.detail(id)
			trailers = Tmdb::Movie.trailers(id)
			@trailers = trailers.youtube
			@casts = Tmdb::Movie.casts(id)
			@credits = Tmdb::Movie.credits(id)
		end
	end

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
