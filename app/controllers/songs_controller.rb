class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all;
  end

  def show
    @artist = @song.artist;
  end

  def destroy
    @artist = @song.artist
    @song.destroy
    redirect_to artist_path(@artist), notice: "Song removed"
  end
  #
  # def destroy_all
  #
  # end


  private
  def set_song

    @song = Song.find(params[:id]);

  end


end
