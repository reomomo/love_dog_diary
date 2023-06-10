class PhotosController < ApplicationController
  before_action :check_dog, only:[:index, :show, :edit]
  before_action :ensure_user, only:[:show, :edit, :update]

  def index
    @user = current_user
    @photos = @user.photos.all.includes(:diary).order("diaries.diary_date").page(params[:page]).per(12)
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:notice_photo] = '写真を追加しました。'
      redirect_to diary_path(@photo.diary.id)
    else
      flash[:notice_photo] = '写真を追加するには、「タイトル」の入力と写真の選択が必要です。'
      redirect_to diary_path(@photo.diary.id)
    end
  end

  def show
  end

  def edit
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.user_id = current_user.id
    @photo.update(photo_params)
    flash[:notice] = '写真を編集しました。'
    redirect_to photo_path(@photo.id)
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.user_id = current_user.id
    photo.destroy
    flash[:notice] = '写真を削除しました。'
    redirect_to photos_path
  end

  private

  def check_dog
    if current_user.my_dogs.empty?
      flash[:info] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end

  def ensure_user
    @photo = Photo.find(params[:id])
    unless @photo.user_id == current_user.id
      redirect_to photos_path
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :body, :image, :user_id, :diary_id, :my_dog_id)
  end

end
