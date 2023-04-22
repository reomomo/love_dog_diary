class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @photos = current_user.photos.page(params[:page]).per(8)
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to diary_path(@photo.diary.id)
  end

  def show
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @photo = Photo.find(params[:id])
    end
  end

  def edit
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @photo = Photo.find(params[:id])
    end
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
