class SongsController < ApplicationController
  before_action :set_artist, only: [:new, :create]

  def index
    @songs = Song.order(:title)
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
      if @song.save
        redirect_to song_path(@song)
      else
        flash[:error] = "#{@song.errors.full_messages.join(", ")}"
        render :new
      end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

private
  def song_params
    params.require(:song).permit(:title)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

end
