class MoviesController < ApplicationController

	def index
		if params[:search].present?
			search = params[:search]
			@result = Tmdb::Movie.find(search)
			@popular = Tmdb::Movie.popular
		end
	end

end
