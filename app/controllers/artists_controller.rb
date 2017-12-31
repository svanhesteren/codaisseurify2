class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]

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

  def create
    @artist = Artist.create(artist_params)

    if @artist.save
      # image_params.each do |image|

      @artist.photo = Photo.new(image: params[:photo], artist: @artist)
      # end
      # redirect_to edit_artist_path(@artist), notice: "Artist successfully created"
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
      # image_params.each do |image|
      @artist.photo = Photo.new(image: params[:photo], artist: @artist)
      # end
      # redirect_to edit_artist_path(@artist), notice: "Artist successfully updated"
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
    params.require(:artist).permit(:name, :fav_food, :Birthday, :songs, :photo)
  end

end
