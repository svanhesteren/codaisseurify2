class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy, :delete_all_songs]

  def index
    @artists = Artist.all;
  end

  def show
    # @artist = Artist.find(artist_params[:id]);
    @songs = @artist.songs;
    @photo = @artist.photo
  end

  def new
    @artist = Artist.new
  end

  def destroy
    @artist.destroy
    redirect_to root_path, notice: "Artist removed"
  end

  def remove_all_songs
    @artist.songs.destroy_all
    redirect_to artist_path(@artist), notice: "All songs removed from this artist"
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      if params[:photo]
        @artist.photo = Photo.new(image: params[:photo], artist: @artist)
      end
      redirect_to artists_path, notice: "Artist successfully created"
    else
      render :new
    end
  end

  def edit
    @photo = @artist.photo
  end

  def update
    if @artist.update(artist_params)
      if params[:photo]
        @artist.photo.destroy if @artist.photo
        @artist.photo = Photo.new(image: params[:photo], artist: @artist)
      end
      redirect_to artists_path, notice: "Artist successfully created"
    else
      render :edit
    end

  end


  private

  def image_params
    params[:photo].present? ? params.require(:photo) : []
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :fav_food, :birthday, :songs, :photo)
  end

end
