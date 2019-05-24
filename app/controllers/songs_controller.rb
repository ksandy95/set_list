class SongsController < ApplicationController
  before_action :get_song, only: [:show, :destroy]
  
  def index
    # @cart = Cart.new(session[:cart])
    @songs = Song.all
  end

  def show
    # @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.create(song_params)
    redirect_to song_path(song)
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :play_count)
  end

  def get_song
    @song = Song.find(params[:id])
  end
end
