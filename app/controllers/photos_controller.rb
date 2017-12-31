class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]

  def destroy

     @artist = @photo.artist
     # if @event.user.id == current_user.id

     @photo.destroy
     redirect_to edit_artist_path(@artist), notice: "Photo successfully removed"
     # else
     #   redirect_to @artist, notice: "Cannot delete that photo"
     # end
   end




   private

   def set_photo
     @photo = Photo.find(params[:id])
   end


end
