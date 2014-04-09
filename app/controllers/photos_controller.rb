class PhotosController < ApplicationController
  before_filter :authorize, except: [:show, :index]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @tags = Tag.all
  end

  def create
    @photo = Photo.new(photo_params)
    @tags = Tag.all
    @all_tags = []
    if !params[:photo][:tag_ids].nil?
      params[:photo][:tag_ids].each do |tag_id|
        if tag_id != ""
          @all_tags << Tag.find(tag_id)
        end
      end
    end

    @all_tags.each { |tag| @photo.tags << tag }
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

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(current_user), notice: "Photo deleted"
  end

  private

  def photo_params
    params.require(:photo).permit(:photo, :caption, :user_id)
  end
end
