class MoviesController < ApplicationController

	def index
		@populars = Tmdb::Movie.popular
		@upcomings = Tmdb::Movie.upcoming
		@nows = Tmdb::Movie.now_playing
		if params[:search].present?
			search = params[:search]
			@results = Tmdb::Movie.find(search)
		end
	end

	def show
		if params[:id].present?
			id = params[:id]
			@result = Tmdb::Movie.detail(id)
			trailer = Tmdb::Movie.trailers(id)
			@trailer = trailer.youtube
			@cast = Tmdb::Movie.casts(id)
			@credit = Tmdb::Movie.credits(id)
		end
	end

end
