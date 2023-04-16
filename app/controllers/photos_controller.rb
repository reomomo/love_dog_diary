class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = current_user.photos.all
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to diary_path(@photo.diary.id)
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
    @photo.update(photo_params)
    redirect_to photo_path(@photo.id)
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.user_id = current_user.id
    photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :body, :image, :user_id, :diary_id, :my_dog_id)
  end

end
