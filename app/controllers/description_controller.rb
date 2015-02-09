class DescriptionController < ApplicationController
  def index
  	if params[:id].present?
		id = params[:id]
		@result = Tmdb::Movie.detail(id)
		trailers = Tmdb::Movie.trailers(id)
		@trailers = trailers.youtube

	end
  end
end
