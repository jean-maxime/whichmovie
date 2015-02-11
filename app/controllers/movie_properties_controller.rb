class MoviePropertiesController < ApplicationController

	def create
		id_user = params[:id_user]
		id_movie = params[:id_movie]
		state = params[:state]
		redirect_to root_url
	end

end
