class PhotosController < ApplicationController
  before_filter :authorize, except: [:show, :index]

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

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :caption, :user_id)
  end
end
