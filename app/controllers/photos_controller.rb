class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = current_user.photos.all
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save!
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.user_id = current_user.id
    @photo.update
    redirect_to photo_path(@photo.id)
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :body, :image)
  end

end
