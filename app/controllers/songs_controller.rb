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
	  	@song = @user.songs.new(artist: params[:song][:artist], title: params[:song][:title], user:current_user)
	  	unless @song.save
  			flash[:errors] = @song.errors.full_messages
  		end
	  	redirect_to '/songs'
	end
end
