class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path, notice: "Photo saved"
    else
      flash[:alert] = "Photo not saved"
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:name,
                                :user_id,
                                :photo_file_name,
                                :photo_content_type,
                                :photo_file_size,
                                :photo_updated_at)
  end
end
