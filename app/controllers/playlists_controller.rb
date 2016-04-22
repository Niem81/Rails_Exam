class PlaylistsController < ApplicationController

	before_action :require_login, only: [:create, :destroy]

	def create
  		song = Song.find(params[:song][:id])
  		playlist = Playlist.create(user: current_user, song: song)
  		redirect_to songs_path
  	end

  	def destroy
  		like = Like.find_by(user: current_user, secret: params[:secret][:id])
  		like.destroy
  		redirect_to :back
  	end


end
