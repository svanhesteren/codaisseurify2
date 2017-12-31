class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:new]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.songs.create
    # @song = @artist.songs.create
  end

  def create
    # @artist = @song.artist
    @song = @artist.songs.create(song_params)

    if @song.save
      redirect_to artist_path(@artist), notice: "Song successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @artist = @song.artist
    if @song.update(song_params)
      redirect_to artist_path(@artist), notice: "Song successfully updated"
    else
      render :edit
    end
  end

  def show
    @artist = @song.artist
  end

  def destroy
    @artist = @song.artist
    @song.destroy
    redirect_to artist_path(@artist), notice: "Song removed"
  end



  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
    # puts "artist = " + @artist.name
  end

  def set_song
    @song = Song.find(params[:id]);
  end

  def song_params
    params.require(:song).permit(:name, :duration, :album, :rating, :artist_id)
  end
end
