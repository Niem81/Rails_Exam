class SongsController < ApplicationController
	def index
  		@song = Song.new
  		@songs = Song.all
  	end

  	def show
  		@song = Song.find(params[:id])
  	end

  	def create
	  	@user = current_user
	  	@user.songs.create(artist: params[:song][:artist], title: params[:song][:title], user:current_user)
	  	redirect_to '/songs'
	end
	def destroy
	  	secret = Secret.find(params[:id])
	  	secret.destroy if secret.user == current_user
	  	redirect_to current_user#@user
	end
end
